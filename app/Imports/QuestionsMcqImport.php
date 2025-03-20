<?php

namespace App\Imports;

use App\Models\Imports;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use App\Models\Quiz;
use App\Models\QuizzesQuestion;
use App\Models\QuizzesQuestionsAnswer;
use App\Models\Translation\QuizzesQuestionsAnswerTranslation;
use App\Models\Translation\QuizzesQuestionTranslation;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;


class QuestionsMcqImport implements ToCollection , WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    private $input;

    public function __construct(array $input) 
    {
        $this->input = $input;
    }
    
    public function collection(Collection $rows)
    {
       
        Validator::make($rows->toArray(), [
            '*.title' => 'required',
            '*.a' => 'required',
            '*.b' => 'required',
            '*.c' => 'required',
            '*.d' => 'required',
        ])->validate();

        $user = auth()->user();
        if($user->id == 1) {
            $quiz = Quiz::where('id', $this->input['quiz_id'])->first();
        } else {
            $quiz = Quiz::where('id', $this->input['quiz_id'])
            ->where('creator_id', $user->id)
            ->first();
        }  
           
        $answers = array();
        foreach ($rows as $row) {
            array_push($answers, $row['a'], $row['b'], $row['c'], $row['d']);
   
            if (!empty($quiz)) {
                $quizQuestion = QuizzesQuestion::create([
                    'quiz_id' => $this->input['quiz_id'],
                    'creator_id' => $quiz['creator_id'],
                    'grade' => $row['grade'],
                    'type' => $row['type'],
                    'created_at' => time()
                ]);

                if (!empty($quizQuestion)) {
                    QuizzesQuestionTranslation::updateOrCreate([
                        'quizzes_question_id' => $quizQuestion->id,
                        'locale' => mb_strtolower($this->input['locale']),
                    ], [
                        'title' => $row['title'],
                        'correct' => $row['correct'] ?? null,
                    ]);
                }

                $quiz->increaseTotalMark($quizQuestion->grade);

                if ($quizQuestion->type == QuizzesQuestion::$multiple and !empty($answers)) {

                    foreach ($answers as $key => $answer) {
                        $answer_is = false;
                        if($row['correct'] == $answer) {
                            $answer_is = true;
                        }
                        $questionAnswer = QuizzesQuestionsAnswer::create([
                            'question_id' => $quizQuestion->id,
                            'creator_id' => $user->id,
                            'correct' => $answer_is,
                            'created_at' => time()
                        ]);

                        if (!empty($questionAnswer)) {
                            QuizzesQuestionsAnswerTranslation::updateOrCreate([
                                'quizzes_questions_answer_id' => $questionAnswer->id,
                                'locale' => mb_strtolower($this->input['locale']),
                            ], [
                                'title' => $answer,
                            ]);
                        }
                    }
                }
                
            }
        }
        
    }
    
}
