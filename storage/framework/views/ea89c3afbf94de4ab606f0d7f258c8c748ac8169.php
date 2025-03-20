<?php
    if (!empty($itemValue) and !is_array($itemValue)) {
        $itemValue = json_decode($itemValue, true);
    }
?>


<div class="tab-pane mt-3 fade <?php if(empty($social)): ?> show active <?php endif; ?>" id="basic" role="tabpanel" aria-labelledby="basic-tab">
    <div class="row">
        <div class="col-12 col-md-6">
            <form action="/admin/settings/main" method="post">
                <?php echo e(csrf_field()); ?>

                <input type="hidden" name="page" value="general">
                <input type="hidden" name="name" value="general">

                <div class="form-group">
                    <label><?php echo e(trans('admin/main.site_name')); ?></label>
                    <input type="text" name="value[site_name]" value="<?php echo e((!empty($itemValue) and !empty($itemValue['site_name'])) ? $itemValue['site_name'] : old('site_name')); ?>" class="form-control "/>
                </div>

                <div class="form-group">
                    <label><?php echo e(trans('admin/main.site_email')); ?></label>
                    <input type="text" name="value[site_email]" value="<?php echo e((!empty($itemValue) and !empty($itemValue['site_email'])) ? $itemValue['site_email'] : old('site_email')); ?>" class="form-control "/>
                </div>

                <div class="form-group">
                    <label><?php echo e(trans('admin/main.site_phone')); ?></label>
                    <input type="text" name="value[site_phone]" value="<?php echo e((!empty($itemValue) and !empty($itemValue['site_phone'])) ? $itemValue['site_phone'] : old('site_phone')); ?>" class="form-control "/>
                </div>

                <div class="form-group">
                    <label class="input-label d-block"><?php echo e(trans('admin/main.site_language')); ?></label>
                    <select name="value[site_language]" class="form-control select2" data-placeholder="<?php echo e(trans('admin/main.site_language')); ?>">
                        <option value=""></option>
                        <?php $__currentLoopData = getLanguages(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($key); ?>" <?php if((!empty($itemValue) and !empty($itemValue['site_language'])) and $itemValue['site_language'] == $key): ?> selected <?php endif; ?> ><?php echo e($language); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                    <div class="text-muted text-small mt-1"><?php echo e(trans('admin/main.default_language_hint')); ?></div>
                </div>

                <div class="form-group">
                    <label class="input-label d-block"><?php echo e(trans('admin/main.register_method')); ?></label>
                    <select name="value[register_method]" class="form-control">
                        <option value="mobile" <?php if(!empty($itemValue) and !empty($itemValue['register_method']) and $itemValue['register_method'] == 'mobile'): ?> selected <?php endif; ?>><?php echo e(trans('admin/main.sms')); ?></option>
                        <option value="email" <?php if(!empty($itemValue) and !empty($itemValue['register_method']) and $itemValue['register_method'] == 'email'): ?> selected <?php endif; ?>><?php echo e(trans('admin/main.email')); ?></option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="input-label d-block"><?php echo e(trans('admin/main.user_languages_lists')); ?></label>
                    <select name="value[user_languages][]" multiple class="form-control select2" data-placeholder="<?php echo e(trans('admin/main.user_languages_lists')); ?>">
                        <option value=""></option>
                        <?php $__currentLoopData = getLanguages(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($key); ?>" <?php if((!empty($itemValue) and !empty($itemValue['user_languages']) and is_array($itemValue['user_languages'])) and in_array($key, $itemValue['user_languages'])): ?> selected <?php endif; ?> ><?php echo e($language); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                    <div class="text-muted text-small mt-1"><?php echo e(trans('admin/main.user_languages_lists_hint')); ?></div>
                </div>


                <div class="form-group">
                    <label class="input-label d-block"><?php echo e(trans('admin/main.rtl_languages')); ?></label>
                    <select name="value[rtl_languages][]" multiple class="form-control select2" data-placeholder="<?php echo e(trans('admin/main.rtl_languages')); ?>">
                        <option value=""></option>
                        <?php $__currentLoopData = getLanguages(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($key); ?>" <?php if((!empty($itemValue) and !empty($itemValue['rtl_languages']) and is_array($itemValue['rtl_languages'])) and in_array($key, $itemValue['rtl_languages'])): ?> selected <?php endif; ?> ><?php echo e($language); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                    <div class="text-muted text-small mt-1"><?php echo e(trans('admin/main.rtl_languages_hint')); ?></div>
                </div>

                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('admin/main.fav_icon')); ?></label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="input-group-text admin-file-manager" data-input="fav_icon" data-preview="holder">
                                <i class="fa fa-upload"></i>
                            </button>
                        </div>
                        <input type="text" name="value[fav_icon]" id="fav_icon" value="<?php echo e((!empty($itemValue) and !empty($itemValue['fav_icon'])) ? $itemValue['fav_icon'] : old('fav_icon')); ?>" class="form-control" placeholder="<?php echo e(trans('admin/main.fav_icon_placeholder')); ?>"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('admin/main.logo')); ?></label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="input-group-text admin-file-manager" data-input="logo" data-preview="holder">
                                <i class="fa fa-upload"></i>
                            </button>
                        </div>
                        <input type="text" name="value[logo]" id="logo" value="<?php echo e((!empty($itemValue) and !empty($itemValue['logo'])) ? $itemValue['logo'] : old('logo')); ?>" class="form-control" placeholder="<?php echo e(trans('admin/main.logo_placeholder')); ?>"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('admin/main.footer_logo')); ?></label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="input-group-text admin-file-manager" data-input="footer_logo" data-preview="holder">
                                <i class="fa fa-upload"></i>
                            </button>
                        </div>
                        <input type="text" name="value[footer_logo]" id="footer_logo" value="<?php echo e((!empty($itemValue) and !empty($itemValue['footer_logo'])) ? $itemValue['footer_logo'] : old('footer_logo')); ?>" class="form-control" placeholder="<?php echo e(trans('admin/main.footer_logo_placeholder')); ?>"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="input-label"><?php echo e(trans('admin/main.webinar_reminder_schedule')); ?></label>
                    <input type="number" name="value[webinar_reminder_schedule]" id="webinar_reminder_schedule" value="<?php echo e((!empty($itemValue) and !empty($itemValue['webinar_reminder_schedule'])) ? $itemValue['webinar_reminder_schedule'] : 1); ?>" class="form-control" />
                </div>

                <div class="form-group custom-switches-stacked">
                    <label class="custom-switch pl-0">
                        <input type="hidden" name="value[rtl_layout]" value="0">
                        <input type="checkbox" name="value[rtl_layout]" id="rtlSwitch" value="1" <?php echo e((!empty($itemValue) and !empty($itemValue['rtl_layout']) and $itemValue['rtl_layout']) ? 'checked="checked"' : ''); ?> class="custom-switch-input"/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="rtlSwitch"><?php echo e(trans('admin/main.rtl_layout')); ?></label>
                    </label>
                </div>

                <div class="form-group custom-switches-stacked">
                    <label class="custom-switch pl-0">
                        <input type="hidden" name="value[preloading]" value="0">
                        <input type="checkbox" name="value[preloading]" id="preloadingSwitch" value="1" <?php echo e((!empty($itemValue) and !empty($itemValue['preloading']) and $itemValue['preloading']) ? 'checked="checked"' : ''); ?> class="custom-switch-input"/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="preloadingSwitch"><?php echo e(trans('admin/main.preloading')); ?></label>
                    </label>
                </div>

                <div class="form-group custom-switches-stacked">
                    <label class="custom-switch pl-0">
                        <input type="hidden" name="value[hero_section1]" value="0">
                        <input type="checkbox" name="value[hero_section1]" id="heroSection1" value="1" <?php echo e((!empty($itemValue) and !empty($itemValue['hero_section1']) and $itemValue['hero_section1']) ? 'checked="checked"' : ''); ?> class="custom-switch-input"/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="heroSection1"><?php echo e(trans('admin/main.main_home_hero')); ?></label>
                    </label>
                </div>

                <div class="form-group custom-switches-stacked">
                    <label class="custom-switch pl-0">
                        <input type="hidden" name="value[hero_section2]" value="0">
                        <input type="checkbox" name="value[hero_section2]" id="heroSection2" value="1" <?php echo e((!empty($itemValue) and !empty($itemValue['hero_section2']) and $itemValue['hero_section2']) ? 'checked="checked"' : ''); ?> class="custom-switch-input"/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="heroSection2"><?php echo e(trans('admin/main.main_home_hero2')); ?></label>
                    </label>
                </div>

                <div class="form-group custom-switches-stacked">
                    <label class="custom-switch pl-0">
                        <input type="hidden" name="value[content_translate]" value="0">
                        <input type="checkbox" name="value[content_translate]" id="contentTranslate" value="1" <?php echo e((!empty($itemValue) and !empty($itemValue['content_translate']) and $itemValue['content_translate']) ? 'checked="checked"' : ''); ?> class="custom-switch-input"/>
                        <span class="custom-switch-indicator"></span>
                        <label class="custom-switch-description mb-0 cursor-pointer" for="contentTranslate"><?php echo e(trans('admin/main.multi_language_content')); ?></label>
                    </label>
                    <div class="text-muted text-small mt-1"><?php echo e(trans('admin/main.multi_language_content_hint')); ?></div>
                </div>


                <button type="submit" class="btn btn-primary"><?php echo e(trans('admin/main.save_change')); ?></button>
            </form>
        </div>
    </div>
</div>

<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/js/admin/settings/general_basic.min.js"></script>
<?php $__env->stopPush(); ?>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/admin/settings/general/basic.blade.php ENDPATH**/ ?>