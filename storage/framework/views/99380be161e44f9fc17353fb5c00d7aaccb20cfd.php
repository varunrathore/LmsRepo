<?php $__env->startPush('styles_top'); ?>
    <link rel="stylesheet" href="/assets/default/vendors/sweetalert2/dist/sweetalert2.min.css">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>

    <section class="section">
        <?php if(\Session::has('success')): ?>
        <div class="alert alert-success mb-3">
            <ul>
                <li><?php echo \Session::get('success'); ?></li>
            </ul>
        </div>
        <?php endif; ?>
        <?php if(count($errors) > 0): ?>
            <div class="row mb-2">
                <div class="col-md-8 col-md-offset-1">
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <h4><i class="icon fa fa-ban"></i> Error!</h4>
                        <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php echo e($error); ?> <br>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>      
                    </div>
                </div>
            </div>
        <?php endif; ?>
        <div class="section-header">
            <h1><?php echo e(trans('admin/main.quizzes')); ?></h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="/admin/"><?php echo e(trans('admin/main.dashboard')); ?></a>
                </div>
                <div class="breadcrumb-item"><?php echo e(trans('admin/main.quizzes')); ?></div>
            </div>
        </div>

        <div class="section-body">


            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form method="post" action="<?php echo e(!empty($quiz) ? '/admin/quizzes/'. $quiz->id .'/update' : '/admin/quizzes/store'); ?>" id="webinarForm" class="webinar-form">
                                <?php echo e(csrf_field()); ?>

                                <section>

                                    <div class="row">
                                        <div class="col-12 col-md-4">


                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="">
                                                    <h2 class="section-title"><?php echo e(trans('quiz.edit_quiz')); ?> - <?php echo e($quiz->title); ?></h2>
                                                    <p><?php echo e(trans('admin/main.instructor')); ?>: <?php echo e($creator->full_name); ?></p>
                                                </div>
                                            </div>

                                            <?php if(!empty(getGeneralSettings('content_translate'))): ?>
                                                <div class="form-group">
                                                    <label class="input-label"><?php echo e(trans('auth.language')); ?></label>
                                                    <select name="locale" class="form-control <?php echo e(!empty($quiz) ? 'js-edit-content-locale' : ''); ?>">
                                                        <?php $__currentLoopData = $userLanguages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($lang); ?>" <?php if(mb_strtolower(request()->get('locale', app()->getLocale())) == mb_strtolower($lang)): ?> selected <?php endif; ?>><?php echo e($language); ?></option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    </select>
                                                    <?php $__errorArgs = ['locale'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                    <div class="invalid-feedback">
                                                        <?php echo e($message); ?>

                                                    </div>
                                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                                </div>
                                            <?php else: ?>
                                                <input type="hidden" name="locale" value="<?php echo e(getDefaultLocale()); ?>">
                                            <?php endif; ?>

                                            <div class="form-group mt-3">
                                                <label class="input-label"><?php echo e(trans('panel.webinar')); ?></label>
                                                <select name="webinar_id" class="custom-select">
                                                    <option <?php echo e(!empty($quiz) ? 'disabled' : 'selected disabled'); ?> value=""><?php echo e(trans('panel.choose_webinar')); ?></option>
                                                    <?php $__currentLoopData = $webinars; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $webinar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($webinar->id); ?>" <?php echo e((!empty($quiz) and $quiz->webinar_id == $webinar->id) ? 'selected' : ''); ?>><?php echo e($webinar->title); ?></option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </select>

                                            </div>

                                            <div class="form-group">
                                                <label class="input-label"><?php echo e(trans('quiz.quiz_title')); ?></label>
                                                <input type="text" value="<?php echo e(!empty($quiz) ? $quiz->title : old('title')); ?>" name="title" class="form-control <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>  is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" placeholder=""/>
                                                <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback">
                                                    <?php echo e($message); ?>

                                                </div>
                                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                            </div>

                                            <div class="form-group">
                                                <label class="input-label"><?php echo e(trans('public.time')); ?> <span class="braces">(<?php echo e(trans('public.minutes')); ?>)</span></label>
                                                <input type="text" value="<?php echo e(!empty($quiz) ? $quiz->time : old('time')); ?>" name="time" class="form-control <?php $__errorArgs = ['time'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>  is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" placeholder="<?php echo e(trans('forms.empty_means_unlimited')); ?>"/>
                                                <?php $__errorArgs = ['time'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback">
                                                    <?php echo e($message); ?>

                                                </div>
                                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                            </div>

                                            <div class="form-group">
                                                <label class="input-label"><?php echo e(trans('quiz.number_of_attemps')); ?></label>
                                                <input type="text" name="attempt" value="<?php echo e(!empty($quiz) ? $quiz->attempt : old('attempt')); ?>" class="form-control <?php $__errorArgs = ['attempt'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>  is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" placeholder="<?php echo e(trans('forms.empty_means_unlimited')); ?>"/>
                                                <?php $__errorArgs = ['attempt'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback">
                                                    <?php echo e($message); ?>

                                                </div>
                                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                            </div>

                                            <div class="form-group">
                                                <label class="input-label"><?php echo e(trans('quiz.pass_mark')); ?></label>
                                                <input type="text" name="pass_mark" value="<?php echo e(!empty($quiz) ? $quiz->pass_mark : old('pass_mark')); ?>" class="form-control <?php $__errorArgs = ['pass_mark'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>  is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" placeholder=""/>
                                                <?php $__errorArgs = ['pass_mark'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                                <div class="invalid-feedback">
                                                    <?php echo e($message); ?>

                                                </div>
                                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                            </div>

                                            <div class="form-group mt-4 d-flex align-items-center justify-content-between">
                                                <label class="cursor-pointer" for="certificateSwitch"><?php echo e(trans('quiz.certificate_included')); ?></label>
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="certificate" class="custom-control-input" id="certificateSwitch" <?php echo e(!empty($quiz) && $quiz->certificate ? 'checked' : ''); ?>>
                                                    <label class="custom-control-label" for="certificateSwitch"></label>
                                                </div>
                                            </div>

                                            <div class="form-group mt-4 d-flex align-items-center justify-content-between">
                                                <label class="cursor-pointer" for="statusSwitch"><?php echo e(trans('quiz.active_quiz')); ?></label>
                                                <div class="custom-control custom-switch">
                                                    <input type="checkbox" name="status" class="custom-control-input" id="statusSwitch" <?php echo e(!empty($quiz) && $quiz->status ? 'checked' : ''); ?>>
                                                    <label class="custom-control-label" for="statusSwitch"></label>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </section>
                                <?php if(!empty($quiz)): ?>
                                    <section class="mt-5">
                                        <div class="d-flex justify-content-between align-items-center pb-20">
                                            <h2 class="section-title after-line"><?php echo e(trans('public.questions')); ?></h2>
                                            <button id="add_multiple_question" type="button" class="btn btn-primary btn-sm ml-2 mt-3"><?php echo e(trans('quiz.add_multiple_choice')); ?></button>
                                            <button id="add_descriptive_question" type="button" class="btn btn-primary btn-sm ml-2 mt-3"><?php echo e(trans('quiz.add_descriptive')); ?></button>
                                            <button id="add_multiple_questions" type="button" class="btn btn-primary btn-sm ml-2 mt-3"><?php echo e(trans('quiz.add_bulk_multiple_choice')); ?></button>
                                            <button id="add_descriptive_questions" type="button" class="btn btn-primary btn-sm ml-2 mt-3"><?php echo e(trans('quiz.bulk_add_descriptive')); ?></button>
                                        </div>
                                        <?php if($quizQuestions): ?>
                                            <?php $__currentLoopData = $quizQuestions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $question): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="quiz-question-card d-flex align-items-center mt-4">
                                                    <div class="flex-grow-1">
                                                        <h4 class="question-title"><?php echo e($question->title); ?></h4>
                                                        <div class="font-12 mt-3 question-infos">
                                                            <span><?php echo e($question->type === App\Models\QuizzesQuestion::$multiple ? trans('quiz.multiple_choice') : trans('quiz.descriptive')); ?> | <?php echo e(trans('quiz.grade')); ?>: <?php echo e($question->grade); ?></span>
                                                        </div>
                                                    </div>

                                                    <div class="btn-group dropdown table-actions">
                                                        <button type="button" class="btn-transparent dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="fa fa-ellipsis-v"></i>
                                                        </button>
                                                        <div class="dropdown-menu text-left">
                                                            <button type="button" data-question-id="<?php echo e($question->id); ?>" class="edit_question btn btn-sm btn-transparent"><?php echo e(trans('public.edit')); ?></button>
                                                            <?php echo $__env->make('admin.includes.delete_button',['url' => '/admin/quizzes-questions/'. $question->id .'/delete', 'btnClass' => 'btn-sm btn-transparent' , 'btnText' => trans('public.delete')], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                    </section>
                                <?php endif; ?>
                                <div class="mt-5 mb-5">
                                    <button type="submit" class="btn btn-primary"><?php echo e(!empty($quiz) ? trans('admin/main.save_change') : trans('admin/main.create')); ?></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Modal -->
    <?php echo $__env->make('admin.quizzes.modals.multiple_question', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('admin.quizzes.modals.descriptive_question', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('admin.quizzes.modals.bulk_multiple_question', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <?php echo $__env->make('admin.quizzes.modals.bulk_descrptive_question', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/vendors/sweetalert2/dist/sweetalert2.min.js"></script>

    <script>
        var saveSuccessLang = '<?php echo e(trans('webinars.success_store')); ?>';
    </script>

    <script src="/assets/default/js/admin/quiz.min.js"></script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\lms\resources\views/admin/quizzes/create.blade.php ENDPATH**/ ?>