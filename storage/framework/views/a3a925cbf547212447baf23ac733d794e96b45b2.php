<div id="descriptiveQuestionModal" class="<?php echo e(empty($question_edit) ? 'd-none' : ''); ?>">
    <div class="custom-modal-body">
        <h2 class="section-title after-line"><?php echo e(trans('quiz.new_descriptive_question')); ?></h2>

        <form action="/admin/quizzes-questions/<?php echo e(empty($question_edit) ? 'store' : $question_edit->id.'/update'); ?>" method="post" >
            <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
            <input type="hidden" name="quiz_id" value="<?php echo e(!empty($quiz) ? $quiz->id :''); ?>">
            <input type="hidden" name="type" value="<?php echo e(\App\Models\QuizzesQuestion::$descriptive); ?>">
            <div class="row mt-3">

                <?php if(!empty(getGeneralSettings('content_translate'))): ?>
                    <div class="col-12">
                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('auth.language')); ?></label>
                            <select name="locale"
                                    class="form-control <?php echo e(!empty($question_edit) ? 'js-quiz-question-locale' : ''); ?>"
                                    data-id="<?php echo e(!empty($question_edit) ? $question_edit->id : ''); ?>"
                            >
                                <?php $__currentLoopData = $userLanguages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($lang); ?>" <?php echo e((!empty($question_edit) and !empty($question_edit->locale)) ? (mb_strtolower($question_edit->locale) == mb_strtolower($lang) ? 'selected' : '') : ($locale == $lang ? 'selected' : '')); ?>><?php echo e($language); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                <?php else: ?>
                    <input type="hidden" name="locale" value="<?php echo e($defaultLocale); ?>">
                <?php endif; ?>

                <div class="col-12 col-md-8">
                    <div class="form-group">
                        <label class="input-label"><?php echo e(trans('quiz.question_title')); ?></label>
                        <input type="text" name="title" class="form-control" value="<?php echo e(!empty($question_edit) ? $question_edit->title : ''); ?>"/>
                    </div>
                </div>

                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label class="input-label"><?php echo e(trans('quiz.grade')); ?></label>
                        <input type="text" name="grade" class="form-control" value="<?php echo e(!empty($question_edit) ? $question_edit->grade : ''); ?>"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="form-group">
                        <label class="input-label"><?php echo e(trans('quiz.correct_answer')); ?></label>
                        <textarea name="correct" id="" class="form-control" rows="10"><?php echo e(!empty($question_edit) ? $question_edit->correct : ''); ?></textarea>
                    </div>
                </div>
            </div>

            <div class="d-flex align-items-center justify-content-end mt-3">
                <button type="button" class="save-question btn btn-sm btn-primary"><?php echo e(trans('public.save')); ?></button>
                <button type="button" class="close-swl btn btn-sm btn-danger ml-2"><?php echo e(trans('public.close')); ?></button>
            </div>
        </form>
    </div>
</div>
<?php /**PATH C:\xampp\htdocs\lms\resources\views/admin/quizzes/modals/descriptive_question.blade.php ENDPATH**/ ?>