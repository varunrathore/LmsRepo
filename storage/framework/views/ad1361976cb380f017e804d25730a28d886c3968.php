<div class="mt-15">
    <div class="row">
        <div class="col-6 col-md-4 font-12 text-gray"><span class="pl-10"><?php echo e(trans('public.title')); ?></span></div>
        <div class="col-3 font-12 text-gray text-center"><?php echo e(trans('public.start_date')); ?></div>
        <div class="col-2 font-12 text-gray text-center d-none d-md-block"><?php echo e(trans('public.duration')); ?></div>
        <div class="col-3"></div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="accordion-content-wrapper mt-15" id="sessionsAccordion" role="tablist" aria-multiselectable="true">
                <?php $__currentLoopData = $sessions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $session): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="accordion-row rounded-sm shadow-lg border mt-20 p-15">
                        <div class="row align-items-center" role="tab" id="session_<?php echo e($session->id); ?>">
                            <div class="col-6 col-md-4 d-flex align-items-center" href="#collapseSession<?php echo e($session->id); ?>" aria-controls="collapseSession<?php echo e($session->id); ?>" data-parent="#sessionsAccordion" role="button" data-toggle="collapse" aria-expanded="true">
                                <?php if($session->date > time()): ?>
                                    <a href="<?php echo e($session->addToCalendarLink()); ?>" target="_blank" class="mr-15 d-flex" data-toggle="tooltip" data-placement="top" title="<?php echo e(trans('public.add_to_calendar')); ?>">
                                        <i data-feather="bell" width="20" height="20" class="text-gray"></i>
                                    </a>
                                <?php else: ?>
                                    <span class="mr-15 d-flex"><i data-feather="bell" width="20" height="20" class="text-gray"></i></span>
                                <?php endif; ?>
                                <span class="font-weight-bold text-secondary font-14"><?php echo e($session->title); ?></span>
                            </div>
                            <div class="col-3 text-gray text-center text-center font-14"><?php echo e(dateTimeFormat($session->date, 'j M Y | H:i')); ?></div>
                            <div class="col-2 text-gray text-center text-center font-14 d-none d-md-block"><?php echo e(convertMinutesToHourAndMinute($session->duration)); ?></div>
                            <div class="col-3 d-flex justify-content-end">
                                <?php if($session->date < time()): ?>
                                    <button type="button" class="course-content-btns btn btn-sm btn-gray disabled flex-grow-1 disabled session-finished-toast"><?php echo e(trans('public.finished')); ?></button>
                                <?php elseif(empty($user)): ?>
                                    <button type="button" class="course-content-btns btn btn-sm btn-gray disabled flex-grow-1 disabled not-login-toast"><?php echo e(trans('public.go_to_class')); ?></button>
                                <?php elseif($hasBought): ?>
                                    <a href="<?php echo e($session->getJoinLink(true)); ?>" target="_blank" class="course-content-btns btn btn-sm btn-primary flex-grow-1"><?php echo e(trans('public.go_to_class')); ?></a>
                                <?php else: ?>
                                    <button type="button" class="course-content-btns btn btn-sm btn-gray flex-grow-1 disabled not-access-toast"><?php echo e(trans('public.go_to_class')); ?></button>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div id="collapseSession<?php echo e($session->id); ?>" aria-labelledby="session_<?php echo e($session->id); ?>" class=" collapse" role="tabpanel">
                            <div class="panel-collapse">
                                <div class="text-gray">
                                    <?php echo nl2br(clean($session->description)); ?>

                                </div>

                                <?php if(!empty($user) and $hasBought): ?>
                                    <div class="d-flex align-items-center mt-20">
                                        <label class="mb-0 mr-10 cursor-pointer font-weight-500" for="sessionReadToggle<?php echo e($session->id); ?>"><?php echo e(trans('public.i_passed_this_lesson')); ?></label>
                                        <div class="custom-control custom-switch">
                                            <input type="checkbox" <?php if($session->date < time()): ?> disabled <?php endif; ?> id="sessionReadToggle<?php echo e($session->id); ?>" data-session-id="<?php echo e($session->id); ?>" value="<?php echo e($course->id); ?>" class="js-text-session-toggle custom-control-input" <?php if(!empty($session->learningStatus)): ?> checked <?php endif; ?>>
                                            <label class="custom-control-label" for="sessionReadToggle<?php echo e($session->id); ?>"></label>
                                        </div>
                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/course/tabs/contents/sessions.blade.php ENDPATH**/ ?>