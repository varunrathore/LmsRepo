<?php

namespace App\Imports;

use App\Models\Imports;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Validator;
use App\Models\Quiz;
use App\Models\QuizzesQuestion;
use App\Models\QuizzesQuestionsAnswer;
use App\Models\Translation\QuizzesQuestionsAnswerTranslation;
use App\Models\Translation\QuizzesQuestionTranslation;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;


class QuestionsDescriptiveImport implements ToCollection , WithHeadingRow
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
        
        $user = auth()->user();
        
        Validator::make($rows->toArray(), [
            '*.title' => 'required',
            '*.correct' => 'required'
        ])->validate();
        
        if($user->id == 1) {
            $quiz = Quiz::where('id', $this->input['quiz_id'])->first();
        } else {
            $quiz = Quiz::where('id', $this->input['quiz_id'])
            ->where('creator_id', $user->id)
            ->first();
        }  
            
        foreach ($rows as $row) {
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
                
            }
        }
        
    }
    
}

