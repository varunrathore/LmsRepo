<!-- Modal -->
<div class="d-none" id="webinarFileModal">
    <h3 class="section-title after-line font-20 text-dark-blue mb-25"><?php echo e(trans('public.add_file')); ?></h3>
    <form action="/admin/files/store" method="post">
        <input type="hidden" name="webinar_id" value="<?php echo e(!empty($webinar) ? $webinar->id :''); ?>">

        <?php if(!empty(getGeneralSettings('content_translate'))): ?>
            <div class="form-group">
                <label class="input-label"><?php echo e(trans('auth.language')); ?></label>
                <select name="locale" class="form-control ">
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

        <div class="form-group">
            <label class="input-label"><?php echo e(trans('public.title')); ?></label>
            <input type="text" name="title" class="form-control" placeholder="<?php echo e(trans('forms.maximum_50_characters')); ?>"/>
            <div class="invalid-feedback"></div>
        </div>

        <div class="form-group">
            <label class="input-label"><?php echo e(trans('public.chapter')); ?></label>
            <select class="custom-select" name="chapter_id">
                <option value=""><?php echo e(trans('admin/main.no_chapter')); ?></option>

                <?php if(!empty($chapters)): ?>
                    <?php $__currentLoopData = $chapters->where('type',\App\Models\WebinarChapter::$chapterFile); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $chapter): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($chapter->id); ?>"><?php echo e($chapter->title); ?></option>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </select>
            <div class="invalid-feedback"></div>
        </div>

        <div class="row">
            <div class="col-6">
                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('public.accessibility')); ?></label>
                    <select class="custom-select" name="accessibility" required>
                        <option selected disabled><?php echo e(trans('public.choose_accessibility')); ?></option>
                        <option value="free"><?php echo e(trans('public.free')); ?></option>
                        <option value="paid"><?php echo e(trans('public.paid')); ?></option>
                    </select>
                    <div class="invalid-feedback"></div>
                </div>
            </div>

            <div class="col-6">
                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('public.source')); ?></label>
                    <select class="custom-select js-file-storage" name="storage">
                        <option value="local" selected><?php echo e(trans('webinars.upload')); ?></option>
                        <option value="online"><?php echo e(trans('webinars.youtube_vimeo')); ?></option>
                    </select>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
        </div>

        <div class="local-input form-group">
            <label class="input-label"><?php echo e(trans('public.file')); ?></label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="input-group-text admin-file-manager" data-input="str_file_path" data-preview="holder">
                        <i class="fa fa-arrow-up"></i>
                    </button>
                </div>
                <input type="text" name="str_file_path" id="str_file_path" class="form-control"/>
                <div class="invalid-feedback"></div>
            </div>
        </div>

        <div class="online-inputs form-group d-none">
            <div class="input-group mt-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fa fa-link"></i>
                    </span>
                </div>
                <input type="text" name="file_path" value="" class="js-ajax-file_path form-control" placeholder="<?php echo e(trans('webinars.file_online_placeholder')); ?>"/>
                <div class="invalid-feedback"></div>
            </div>

            <div class="row mt-2">
                <div class="col-6">
                    <label class="input-label"><?php echo e(trans('webinars.file_type')); ?></label>

                    <select name="file_type" class="js-ajax-file_type form-control">
                        <option value=""><?php echo e(trans('webinars.select_file_type')); ?></option>

                        <?php $__currentLoopData = \App\Models\File::$fileTypes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $fileType): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($fileType); ?>"><?php echo e($fileType); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                    <div class="invalid-feedback"></div>
                </div>
                <div class="col-6">
                    <label class="input-label"><?php echo e(trans('webinars.file_volume')); ?></label>
                    <input type="text" name="volume" value="" class="js-ajax-volume form-control" placeholder="<?php echo e(trans('webinars.online_file_volume')); ?>"/>
                    <div class="invalid-feedback"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="input-label"><?php echo e(trans('public.description')); ?></label>
            <textarea name="description" class="form-control" rows="6"></textarea>
            <div class="invalid-feedback"></div>
        </div>

        <div class="js-downloadable-file form-group mt-3">
            <div class="d-flex align-items-center justify-content-between">
                <label class="cursor-pointer input-label" for="downloadableSwitch_record"><?php echo e(trans('home.downloadable')); ?></label>
                <div class="custom-control custom-switch">
                    <input type="checkbox" name="downloadable" checked class="custom-control-input" id="downloadableSwitch_record">
                    <label class="custom-control-label" for="downloadableSwitch_record"></label>
                </div>
            </div>
        </div>

        <div class="js-file-status form-group mt-3">
            <div class="d-flex align-items-center justify-content-between">
                <label class="cursor-pointer input-label" for="fileStatusSwitch_record"><?php echo e(trans('admin/main.active')); ?></label>
                <div class="custom-control custom-switch">
                    <input type="checkbox" name="status" checked class="custom-control-input" id="fileStatusSwitch_record">
                    <label class="custom-control-label" for="fileStatusSwitch_record"></label>
                </div>
            </div>
        </div>

        <div class="mt-30 d-flex align-items-center justify-content-end">
            <button type="button" id="saveFile" class="btn btn-primary"><?php echo e(trans('public.save')); ?></button>
            <button type="button" class="btn btn-danger ml-2 close-swl"><?php echo e(trans('public.close')); ?></button>
        </div>
    </form>
</div>
<?php /**PATH C:\xampp\htdocs\lms\resources\views/admin/webinars/modals/file.blade.php ENDPATH**/ ?>