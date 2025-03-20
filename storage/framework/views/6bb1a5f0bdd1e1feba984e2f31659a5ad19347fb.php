<li data-id="<?php echo e(!empty($file) ? $file->id :''); ?>" class="accordion-row bg-white rounded-sm border border-gray300 mt-20 py-15 py-lg-30 px-10 px-lg-20">
    <div class="d-flex align-items-center justify-content-between " role="tab" id="file_<?php echo e(!empty($file) ? $file->id :'record'); ?>">
        <div class="d-flex align-items-center" href="#collapseFile<?php echo e(!empty($file) ? $file->id :'record'); ?>" aria-controls="collapseFile<?php echo e(!empty($file) ? $file->id :'record'); ?>" data-parent="#chapterContentAccordion<?php echo e(!empty($chapter) ? $chapter->id :''); ?>" role="button" data-toggle="collapse" aria-expanded="true">
            <span class="chapter-icon chapter-content-icon mr-10">
                <i data-feather="file-text" class=""></i>
            </span>

            <div class="font-weight-bold text-dark-blue d-block"><?php echo e(!empty($file) ? $file->title . ($file->accessibility == 'free' ? " (". trans('public.free') .")" : '') : trans('public.add_new_files')); ?></div>
        </div>

        <div class="d-flex align-items-center">
            <?php if(!empty($file) and $file->status != \App\Models\WebinarChapter::$chapterActive): ?>
                <span class="disabled-content-badge mr-10"><?php echo e(trans('public.disabled')); ?></span>
            <?php endif; ?>


            <i data-feather="move" class="move-icon mr-10 cursor-pointer" height="20"></i>

            <?php if(!empty($file)): ?>
                <a href="/panel/files/<?php echo e($file->id); ?>/delete" class="delete-action btn btn-sm btn-transparent text-gray">
                    <i data-feather="trash-2" class="mr-10 cursor-pointer" height="20"></i>
                </a>
            <?php endif; ?>

            <i class="collapse-chevron-icon" data-feather="chevron-down" height="20" href="#collapseFile<?php echo e(!empty($file) ? $file->id :'record'); ?>" aria-controls="collapseFile<?php echo e(!empty($file) ? $file->id :'record'); ?>" data-parent="#chapterContentAccordion<?php echo e(!empty($chapter) ? $chapter->id :''); ?>" role="button" data-toggle="collapse" aria-expanded="true"></i>
        </div>
    </div>

    <div id="collapseFile<?php echo e(!empty($file) ? $file->id :'record'); ?>" aria-labelledby="file_<?php echo e(!empty($file) ? $file->id :'record'); ?>" class=" collapse <?php if(empty($file)): ?> show <?php endif; ?>" role="tabpanel">
        <div class="panel-collapse text-gray">
            <div class="js-content-form file-form" data-action="/panel/files/<?php echo e(!empty($file) ? $file->id . '/update' : 'store'); ?>">
                <input type="hidden" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][webinar_id]" value="<?php echo e(!empty($webinar) ? $webinar->id :''); ?>">
                <input type="hidden" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][chapter_id]" value="<?php echo e(!empty($chapter) ? $chapter->id :''); ?>" class="chapter-input">

                <div class="row">
                    <div class="col-12 col-lg-6">

                        <?php if(!empty(getGeneralSettings('content_translate'))): ?>
                            <div class="form-group">
                                <label class="input-label"><?php echo e(trans('auth.language')); ?></label>
                                <select name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][locale]"
                                        class="form-control <?php echo e(!empty($file) ? 'js-webinar-content-locale' : ''); ?>"
                                        data-webinar-id="<?php echo e(!empty($webinar) ? $webinar->id : ''); ?>"
                                        data-id="<?php echo e(!empty($file) ? $file->id : ''); ?>"
                                        data-relation="files"
                                        data-fields="title,description"
                                >
                                    <?php $__currentLoopData = $userLanguages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($lang); ?>" <?php echo e((!empty($file) and !empty($file->locale)) ? (mb_strtolower($file->locale) == mb_strtolower($lang) ? 'selected' : '') : ($locale == $lang ? 'selected' : '')); ?>><?php echo e($language); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        <?php else: ?>
                            <input type="hidden" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][locale]" value="<?php echo e($defaultLocale); ?>">
                        <?php endif; ?>


                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.title')); ?></label>
                            <input type="text" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][title]" class="js-ajax-title form-control" value="<?php echo e(!empty($file) ? $file->title : ''); ?>" placeholder="<?php echo e(trans('forms.maximum_50_characters')); ?>"/>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.accessibility')); ?></label>

                            <div class="d-flex align-items-center js-ajax-accessibility">
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][accessibility]" value="free" <?php if(empty($file) or (!empty($file) and $file->accessibility == 'free')): ?> checked="checked" <?php endif; ?> id="accessibilityRadio1_<?php echo e(!empty($file) ? $file->id : 'record'); ?>" class="custom-control-input">
                                    <label class="custom-control-label font-14 cursor-pointer" for="accessibilityRadio1_<?php echo e(!empty($file) ? $file->id : 'record'); ?>"><?php echo e(trans('public.free')); ?></label>
                                </div>

                                <div class="custom-control custom-radio ml-15">
                                    <input type="radio" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][accessibility]" value="paid" <?php if(!empty($file) and $file->accessibility == 'paid'): ?> checked="checked" <?php endif; ?> id="accessibilityRadio2_<?php echo e(!empty($file) ? $file->id : 'record'); ?>" class="custom-control-input">
                                    <label class="custom-control-label font-14 cursor-pointer" for="accessibilityRadio2_<?php echo e(!empty($file) ? $file->id : 'record'); ?>"><?php echo e(trans('public.paid')); ?></label>
                                </div>
                            </div>

                            <div class="invalid-feedback"></div>
                        </div>


                        <div class="form-group pt-15">
                            <label class="input-label"><?php echo e(trans('public.source')); ?></label>

                            <div class="d-flex align-items-center">
                                <div class="custom-control custom-radio">
                                    <input type="radio" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][storage]" value="local" <?php if(empty($file) or $file->storage != 'online'): ?> checked="checked" <?php endif; ?> id="customRadio1_<?php echo e(!empty($file) ? $file->id : 'record'); ?>" class="js-file-storage custom-control-input">
                                    <label class="custom-control-label font-14 cursor-pointer" for="customRadio1_<?php echo e(!empty($file) ? $file->id : 'record'); ?>"><?php echo e(trans('webinars.upload')); ?></label>
                                </div>

                                <div class="custom-control custom-radio ml-15">
                                    <input type="radio" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][storage]" value="online" <?php if(!empty($file) and $file->storage == 'online'): ?> checked="checked" <?php endif; ?> id="customRadio2_<?php echo e(!empty($file) ? $file->id : 'record'); ?>" class="js-file-storage custom-control-input">
                                    <label class="custom-control-label font-14 cursor-pointer" for="customRadio2_<?php echo e(!empty($file) ? $file->id : 'record'); ?>"><?php echo e(trans('webinars.youtube_vimeo')); ?></label>
                                </div>
                            </div>

                            <div class="local-input input-group mt-20 <?php if(!empty($file) and $file->storage == 'online'): ?> d-none <?php endif; ?>">
                                <div class="input-group-prepend">
                                    <button type="button" class="input-group-text panel-file-manager" data-input="file_path<?php echo e(!empty($file) ? $file->id : 'record'); ?>" data-preview="holder">
                                        <i data-feather="arrow-up" width="18" height="18" class="text-white"></i>
                                    </button>
                                </div>
                                <input type="text" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][file_path]" id="file_path<?php echo e(!empty($file) ? $file->id : 'record'); ?>" value="<?php echo e((!empty($file) and $file->storage != 'online') ? $file->file : ''); ?>" class="js-ajax-file_path form-control" placeholder="<?php echo e(trans('webinars.file_upload_placeholder')); ?>"/>
                                <div class="invalid-feedback"></div>
                            </div>

                            <div class="online-inputs <?php if(empty($file) or $file->storage != 'online'): ?> d-none <?php endif; ?>">
                                <div class="input-group mt-20">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i data-feather="link" width="18" height="18" class="text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][file_path]" value="<?php echo e((!empty($file) and $file->storage == 'online') ? $file->file : ''); ?>" class="js-ajax-file_path form-control" placeholder="<?php echo e(trans('webinars.file_online_placeholder')); ?>"/>
                                    <div class="invalid-feedback"></div>
                                </div>

                                <div class="row mt-15">
                                    <div class="col-6">
                                        <label class="input-label"><?php echo e(trans('webinars.file_type')); ?></label>

                                        <select name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][file_type]" class="js-ajax-file_type form-control">
                                            <option value=""><?php echo e(trans('webinars.select_file_type')); ?></option>

                                            <?php $__currentLoopData = \App\Models\File::$fileTypes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $fileType): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($fileType); ?>" <?php if(!empty($file) and $file->storage == 'online' and $file->file_type == $fileType): ?> selected <?php endif; ?>><?php echo e($fileType); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                    <div class="col-6">
                                        <label class="input-label"><?php echo e(trans('webinars.file_volume')); ?></label>
                                        <input type="text" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][volume]" value="<?php echo e((!empty($file) and $file->storage == 'online') ? $file->volume : ''); ?>" class="js-ajax-volume form-control" placeholder="<?php echo e(trans('webinars.online_file_volume')); ?>"/>
                                        <div class="invalid-feedback"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.description')); ?></label>
                            <textarea name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][description]" class="js-ajax-description form-control" rows="6"><?php echo e(!empty($file) ? $file->description : ''); ?></textarea>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="js-downloadable-file form-group mt-20 <?php if(!empty($file) and $file->storage == 'online'): ?> d-none <?php endif; ?>">
                            <div class="d-flex align-items-center justify-content-between">
                                <label class="cursor-pointer input-label" for="downloadableSwitch<?php echo e(!empty($file) ? $file->id : '_record'); ?>"><?php echo e(trans('home.downloadable')); ?></label>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][downloadable]" class="custom-control-input" id="downloadableSwitch<?php echo e(!empty($file) ? $file->id : '_record'); ?>" <?php echo e((empty($file) or $file->downloadable) ? 'checked' : ''); ?>>
                                    <label class="custom-control-label" for="downloadableSwitch<?php echo e(!empty($file) ? $file->id : '_record'); ?>"></label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mt-20">
                            <div class="d-flex align-items-center justify-content-between">
                                <label class="cursor-pointer input-label" for="fileStatusSwitch<?php echo e(!empty($file) ? $file->id : '_record'); ?>"><?php echo e(trans('public.active')); ?></label>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="ajax[<?php echo e(!empty($file) ? $file->id : 'new'); ?>][status]" class="custom-control-input" id="fileStatusSwitch<?php echo e(!empty($file) ? $file->id : '_record'); ?>" <?php echo e((empty($file) or $file->status == \App\Models\File::$Active) ? 'checked' : ''); ?>>
                                    <label class="custom-control-label" for="fileStatusSwitch<?php echo e(!empty($file) ? $file->id : '_record'); ?>"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-30 d-flex align-items-center">
                    <button type="button" class="js-save-file btn btn-sm btn-primary"><?php echo e(trans('public.save')); ?></button>

                    <?php if(empty($file)): ?>
                        <button type="button" class="btn btn-sm btn-danger ml-10 cancel-accordion"><?php echo e(trans('public.close')); ?></button>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</li>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/panel/webinar/create_includes/accordions/file.blade.php ENDPATH**/ ?>