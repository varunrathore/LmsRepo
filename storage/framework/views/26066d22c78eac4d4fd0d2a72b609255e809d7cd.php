<div id="bulkMultipleQuestionModal" class="<?php if(!empty($quiz)): ?> bulkMultipleQuestionModal<?php echo e($quiz->id); ?> <?php endif; ?> <?php echo e(empty($question_edit) ? 'd-none' : ''); ?>">
    <div class="custom-modal-body">
        <h2 class="section-title after-line"><?php echo e(trans('quiz.multiple_choice_question')); ?></h2>

        <form id="upload-form" method="post" enctype="multipart/form-data" class="quiz-questions-form-bulk" action="/panel/quizzes-questions/<?php echo e(empty($question_edit) ? 'store' : $question_edit->id.'/update'); ?>">

            <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
            <input type="hidden" name="quiz_id" value="<?php echo e(!empty($quiz) ? $quiz->id :''); ?>">
            <input type="hidden" name="type" value="<?php echo e(\App\Models\QuizzesQuestion::$multiple); ?>">

            <div class="row mt-25">
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
                        <label class="input-label"><?php echo e(trans('quiz.upload_file')); ?></label>
                        <input id="bulkFile" type="file" name="file" class="form-control lfm-input"/>
                    </div>
                </div>
            </div>

            <div class="d-flex align-items-center justify-content-end mt-25">
                <button type="submit" class="save-question-file btn btn-sm btn-primary"><?php echo e(trans('public.save')); ?></button>
                <button type="button" class="close-swl btn btn-sm btn-danger ml-10"><?php echo e(trans('public.close')); ?></button>
            </div>

    </form>
    </div>
</div>

<?php /**PATH C:\xampp\htdocs\lms\resources\views/web/default/panel/quizzes/modals/bulk_multiple_question.blade.php ENDPATH**/ ?>