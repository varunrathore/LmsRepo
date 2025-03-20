<div id="bulkMultipleQuestionModal" class="@if(!empty($quiz)) bulkMultipleQuestionModal{{ $quiz->id }} @endif {{ empty($question_edit) ? 'd-none' : ''}}">
    <div class="custom-modal-body">
        <h2 class="section-title after-line">{{ trans('quiz.multiple_choice_question') }}</h2>

        <form id="upload-form" method="post" enctype="multipart/form-data" class="quiz-questions-form-bulk" action="/panel/quizzes-questions/{{ empty($question_edit) ? 'store' : $question_edit->id.'/update' }}">

            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <input type="hidden" name="quiz_id" value="{{ !empty($quiz) ? $quiz->id :'' }}">
            <input type="hidden" name="type" value="{{ \App\Models\QuizzesQuestion::$multiple }}">

            <div class="row mt-25">
                @if(!empty(getGeneralSettings('content_translate')))
                    <div class="col-12">
                        <div class="form-group">
                            <label class="input-label">{{ trans('auth.language') }}</label>
                            <select name="locale"
                                    class="form-control {{ !empty($question_edit) ? 'js-quiz-question-locale' : '' }}"
                                    data-id="{{ !empty($question_edit) ? $question_edit->id : '' }}"
                            >
                                @foreach($userLanguages as $lang => $language)
                                    <option value="{{ $lang }}" {{ (!empty($question_edit) and !empty($question_edit->locale)) ? (mb_strtolower($question_edit->locale) == mb_strtolower($lang) ? 'selected' : '') : ($locale == $lang ? 'selected' : '') }}>{{ $language }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                @else
                    <input type="hidden" name="locale" value="{{ $defaultLocale }}">
                @endif

                <div class="col-12 col-md-8">
                    <div class="form-group">
                        <label class="input-label">{{ trans('quiz.upload_file') }}</label>
                        <input id="bulkFile" type="file" name="file" class="form-control lfm-input"/>
                    </div>
                </div>
            </div>

            <div class="d-flex align-items-center justify-content-end mt-25">
                <button type="submit" class="save-question-file btn btn-sm btn-primary">{{ trans('public.save') }}</button>
                <button type="button" class="close-swl btn btn-sm btn-danger ml-10">{{ trans('public.close') }}</button>
            </div>

    </form>
    </div>
</div>

