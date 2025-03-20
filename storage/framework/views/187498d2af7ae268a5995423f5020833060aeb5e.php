<li data-id="<?php echo e(!empty($session) ? $session->id :''); ?>" class="accordion-row bg-white rounded-sm border border-gray300 mt-20 py-15 py-lg-30 px-10 px-lg-20">
    <div class="d-flex align-items-center justify-content-between " role="tab" id="session_<?php echo e(!empty($session) ? $session->id :'record'); ?>">
        <div class="d-flex align-items-center" href="#collapseSession<?php echo e(!empty($session) ? $session->id :'record'); ?>" aria-controls="collapseSession<?php echo e(!empty($session) ? $session->id :'record'); ?>" data-parent="#chapterContentAccordion<?php echo e(!empty($chapter) ? $chapter->id :''); ?>" role="button" data-toggle="collapse" aria-expanded="true">
            <span class="chapter-icon chapter-content-icon mr-10">
                <i data-feather="file-text" class=""></i>
            </span>

            <div class="font-weight-bold text-dark-blue d-block"><?php echo e(!empty($session) ? $session->title : trans('public.add_new_sessions')); ?></div>
        </div>

        <div class="d-flex align-items-center">
            <?php if(!empty($session) and $session->status != \App\Models\WebinarChapter::$chapterActive): ?>
                <span class="disabled-content-badge mr-10"><?php echo e(trans('public.disabled')); ?></span>
            <?php endif; ?>

            <i data-feather="move" class="move-icon mr-10 cursor-pointer" height="20"></i>

            <?php if(!empty($session)): ?>
                <a href="/panel/sessions/<?php echo e($session->id); ?>/delete" class="delete-action btn btn-sm btn-transparent text-gray">
                    <i data-feather="trash-2" class="mr-10 cursor-pointer" height="20"></i>
                </a>
            <?php endif; ?>

            <i class="collapse-chevron-icon" data-feather="chevron-down" height="20" href="#collapseSession<?php echo e(!empty($session) ? $session->id :'record'); ?>" aria-controls="collapseSession<?php echo e(!empty($session) ? $session->id :'record'); ?>" data-parent="#chapterContentAccordion<?php echo e(!empty($chapter) ? $chapter->id :''); ?>" role="button" data-toggle="collapse" aria-expanded="true"></i>
        </div>
    </div>

    <div id="collapseSession<?php echo e(!empty($session) ? $session->id :'record'); ?>" aria-labelledby="session_<?php echo e(!empty($session) ? $session->id :'record'); ?>" class=" collapse <?php if(empty($session)): ?> show <?php endif; ?>" role="tabpanel">
        <div class="panel-collapse text-gray">
            <div class="js-content-form session-form" data-action="/panel/sessions/<?php echo e(!empty($session) ? $session->id . '/update' : 'store'); ?>">
                <input type="hidden" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][webinar_id]" value="<?php echo e(!empty($webinar) ? $webinar->id :''); ?>">
                <input type="hidden" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][chapter_id]" value="<?php echo e(!empty($chapter) ? $chapter->id :''); ?>" class="chapter-input">

                <div class="row">
                    <div class="col-12 col-lg-6">

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('webinars.select_session_api')); ?></label>

                            <div class="js-session-api">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][session_api]" id="localApi<?php echo e(!empty($session) ? $session->id : ''); ?>" value="local" <?php if(empty($session) or $session->session_api == 'local'): ?> checked <?php endif; ?> class="js-api-input custom-control-input" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>>
                                    <label class="custom-control-label" for="localApi<?php echo e(!empty($session) ? $session->id : ''); ?>"><?php echo e(trans('webinars.session_local_api')); ?></label>
                                </div>

                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][session_api]" id="bigBlueButton<?php echo e(!empty($session) ? $session->id : ''); ?>" value="big_blue_button" <?php if(!empty($session) and $session->session_api == 'big_blue_button'): ?> checked <?php endif; ?> class="js-api-input custom-control-input" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>>
                                    <label class="custom-control-label" for="bigBlueButton<?php echo e(!empty($session) ? $session->id : ''); ?>"><?php echo e(trans('webinars.session_big_blue_button')); ?></label>
                                </div>

                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][session_api]" id="zoomApi<?php echo e(!empty($session) ? $session->id : ''); ?>" value="zoom" <?php if(!empty($session) and $session->session_api == 'zoom'): ?> checked <?php endif; ?> class="js-api-input custom-control-input" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>>
                                    <label class="custom-control-label" for="zoomApi<?php echo e(!empty($session) ? $session->id : ''); ?>"><?php echo e(trans('webinars.session_zoom')); ?></label>
                                </div>
                            </div>

                            <div class="invalid-feedback"></div>

                            <div class="js-zoom-not-complete-alert mt-10 text-danger d-none">
                                <?php echo e(trans('webinars.your_zoom_settings_are_not_complete')); ?>

                                <a href="/panel/setting/step/8" class="text-primary" target="_blank"><?php echo e(trans('public.go_to_settings')); ?></a>
                            </div>
                        </div>

                        <?php if(!empty(getGeneralSettings('content_translate'))): ?>
                            <div class="form-group">
                                <label class="input-label"><?php echo e(trans('auth.language')); ?></label>
                                <select name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][locale]"
                                        class="form-control <?php echo e(!empty($session) ? 'js-webinar-content-locale' : ''); ?>"
                                        data-webinar-id="<?php echo e(!empty($webinar) ? $webinar->id : ''); ?>"
                                        data-id="<?php echo e(!empty($session) ? $session->id : ''); ?>"
                                        data-relation="sessions"
                                        data-fields="title,description"
                                >
                                    <?php $__currentLoopData = $userLanguages; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang => $language): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($lang); ?>" <?php echo e((!empty($session) and !empty($session->locale)) ? (mb_strtolower($session->locale) == mb_strtolower($lang) ? 'selected' : '') : ($locale == $lang ? 'selected' : '')); ?>><?php echo e($language); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        <?php else: ?>
                            <input type="hidden" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][locale]" value="<?php echo e($defaultLocale); ?>">
                        <?php endif; ?>

                        <div class="form-group js-api-secret <?php echo e((!empty($session) and $session->session_api == 'zoom') ? 'd-none' :''); ?>">
                            <label class="input-label"><?php echo e(trans('auth.password')); ?></label>
                            <input type="text" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][api_secret]" class="js-ajax-api_secret form-control" value="<?php echo e(!empty($session) ? $session->api_secret : ''); ?>" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>/>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group js-moderator-secret <?php echo e((empty($session) or $session->session_api != 'big_blue_button') ? 'd-none' :''); ?>">
                            <label class="input-label"><?php echo e(trans('public.moderator_password')); ?></label>
                            <input type="text" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][moderator_secret]" class="js-ajax-moderator_secret form-control" value="<?php echo e(!empty($session) ? $session->moderator_secret : ''); ?>" <?php echo e((!empty($session) and $session->session_api == 'big_blue_button') ? 'disabled' :''); ?>/>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.title')); ?></label>
                            <input type="text" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][title]" class="js-ajax-title form-control" value="<?php echo e(!empty($session) ? $session->title : ''); ?>" placeholder="<?php echo e(trans('forms.maximum_50_characters')); ?>"/>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.date')); ?></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="dateRangeLabel">
                                        <i data-feather="calendar" width="18" height="18" class="text-white"></i>
                                    </span>
                                </div>
                                <input type="text" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][date]" class="js-ajax-date form-control datetimepicker" value="<?php echo e(!empty($session) ? dateTimeFormat($session->date, 'Y-m-d H:i') : ''); ?>" aria-describedby="dateRangeLabel" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>/>
                                <div class="invalid-feedback"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.duration')); ?> <span class="braces">(<?php echo e(trans('public.minutes')); ?>)</span></label>
                            <input type="text" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][duration]" class="js-ajax-duration form-control" value="<?php echo e(!empty($session) ? $session->duration : ''); ?>" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>/>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group js-local-link">
                            <label class="input-label"><?php echo e(trans('public.link')); ?></label>
                            <input type="text" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][link]" class="js-ajax-link form-control" value="<?php echo e(!empty($session) ? $session->getJoinLink() : ''); ?>" <?php echo e((!empty($session) and $session->session_api != 'local') ? 'disabled' :''); ?>/>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group">
                            <label class="input-label"><?php echo e(trans('public.description')); ?></label>
                            <textarea name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][description]" class="js-ajax-description form-control" rows="6"><?php echo e(!empty($session) ? $session->description : ''); ?></textarea>
                            <div class="invalid-feedback"></div>
                        </div>

                        <div class="form-group mt-20">
                            <div class="d-flex align-items-center justify-content-between">
                                <label class="cursor-pointer input-label" for="sessionStatusSwitch<?php echo e(!empty($session) ? $session->id : '_record'); ?>"><?php echo e(trans('public.active')); ?></label>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" name="ajax[<?php echo e(!empty($session) ? $session->id : 'new'); ?>][status]" class="custom-control-input" id="sessionStatusSwitch<?php echo e(!empty($session) ? $session->id : '_record'); ?>" <?php echo e((empty($session) or $session->status == \App\Models\Session::$Active) ? 'checked' : ''); ?>>
                                    <label class="custom-control-label" for="sessionStatusSwitch<?php echo e(!empty($session) ? $session->id : '_record'); ?>"></label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="mt-30 d-flex align-items-center">
                    <button type="button" class="js-save-session btn btn-sm btn-primary"><?php echo e(trans('public.save')); ?></button>

                    <?php if(!empty($session)): ?>
                        <a href="<?php echo e($session->getJoinLink(true)); ?>" target="_blank" class="ml-10 btn btn-sm btn-secondary"><?php echo e(trans('footer.join')); ?></a>
                    <?php endif; ?>

                    <?php if(empty($session)): ?>
                        <button type="button" class="btn btn-sm btn-danger ml-10 cancel-accordion"><?php echo e(trans('public.close')); ?></button>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</li>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/panel/webinar/create_includes/accordions/session.blade.php ENDPATH**/ ?>