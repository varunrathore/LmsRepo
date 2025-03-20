<div id="chapterModalHtml" class="d-none">
    <div class="custom-modal-body">
        <h2 class="section-title after-line"><?php echo e(trans('public.new_chapter')); ?></h2>

        <div class="js-content-form chapter-form mt-20" data-action="/panel/chapters/store">

            <input type="hidden" name="ajax[chapter][webinar_id]" class="js-chapter-webinar-id" value="">
            <input type="hidden" name="ajax[chapter][type]" class="js-chapter-type" value="">

            <?php if(!empty(getGeneralSettings('content_translate'))): ?>

                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('auth.language')); ?></label>
                    <select name="ajax[chapter][locale]"
                            class="form-control js-chapter-locale"
                            data-webinar-id="<?php echo e(!empty($webinar) ? $webinar->id : ''); ?>"
                            data-id=""
                            data-relation="chapters"
                            data-fields="title"
                    >
                        <?php $__currentLoopData = $userLanguages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($lang); ?>"><?php echo e($language); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
            <?php else: ?>
                <input type="hidden" name="ajax[chapter][locale]" value="<?php echo e($defaultLocale); ?>">
            <?php endif; ?>


            <div class="form-group">
                <label class="input-label"><?php echo e(trans('public.chapter_title')); ?></label>
                <input type="text" name="ajax[chapter][title]" class="form-control js-ajax-title" value=""/>
                <span class="invalid-feedback"></span>
            </div>

            <div class="form-group mt-2 d-flex align-items-center justify-content-between js-switch-parent">
                <label class="js-switch cursor-pointer" for="chapterStatus_record"><?php echo e(trans('public.active')); ?></label>

                <div class="custom-control custom-switch">
                    <input id="chapterStatus_record" type="checkbox" checked name="ajax[chapter][status]" class="custom-control-input js-switch">
                    <label class="custom-control-label js-switch" for="chapterStatus_record"></label>
                </div>
            </div>

            <div class="d-flex align-items-center justify-content-end mt-3">
                <button type="button" class="save-chapter btn btn-sm btn-primary"><?php echo e(trans('public.save')); ?></button>
                <button type="button" class="close-swl btn btn-sm btn-danger ml-2"><?php echo e(trans('public.close')); ?></button>
            </div>

        </div>
    </div>
</div>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/panel/webinar/create_includes/chapter_modal.blade.php ENDPATH**/ ?>