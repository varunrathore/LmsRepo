<?php if(!empty($meeting) and !empty($meeting->meetingTimes) and $meeting->meetingTimes->count() > 0): ?>

    <div class="mt-40">
        <h3 class="font-16 font-weight-bold text-dark-blue"><?php echo e(trans('site.view_available_times')); ?></h3>

        <div class="mt-35">
            <div class="row align-items-center justify-content-center">
                <input type="hidden" id="inlineCalender" class="form-control">
                <div class="inline-reservation-calender"></div>
            </div>
        </div>
    </div>

    <div class="mt-40 pick-a-time" id="PickTimeContainer" data-user-id="<?php echo e($user["id"]); ?>">
        <div class="loading-img d-none text-center">
            <img src="/assets/default/img/loading.gif" width="80" height="80">
        </div>

        <form action="<?php echo e((!$meeting->disabled) ? '/meetings/reserve' : ''); ?>" method="post" id="PickTimeBody" class="d-none">
            <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
            <input type="hidden" name="day" id="selectedDay" value="">

            <h3 class="font-16 font-weight-bold text-dark-blue">
                <?php if($meeting->disabled): ?>
                    <?php echo e(trans('public.unavailable')); ?>

                <?php else: ?>
                    <?php echo e(trans('site.pick_a_time')); ?>

                    <?php if(!empty($meeting) and !empty($meeting->discount) and !empty($meeting->amount) and $meeting->amount > 0): ?>
                        <span class="badge badge-danger text-white font-12"><?php echo e($meeting->discount); ?>% <?php echo e(trans('public.off')); ?></span>
                    <?php endif; ?>
                <?php endif; ?>
            </h3>

            <div class="d-flex flex-column mt-10">
                <?php if($meeting->disabled): ?>
                    <span class="font-14 text-gray"><?php echo e(trans('public.unavailable_description')); ?></span>
                <?php else: ?>
                    <span class="font-14 text-gray font-weight-500">
                        <?php echo e(trans('site.instructor_hourly_charge')); ?>


                        <?php if(!empty($meeting->amount) and $meeting->amount > 0): ?>
                            <?php if(!empty($meeting->discount)): ?>
                                <span class="text-decoration-line-through"><?php echo e($currency); ?><?php echo e($meeting->amount); ?></span>
                                <span class="text-primary"><?php echo e($currency); ?><?php echo e($meeting->amount - (($meeting->amount * $meeting->discount) / 100)); ?></span>
                            <?php else: ?>
                                <span class="text-primary"><?php echo e($currency); ?><?php echo e($meeting->amount); ?></span>
                            <?php endif; ?>
                        <?php else: ?>
                            <span class="text-primary"><?php echo e(trans('public.free')); ?></span>
                        <?php endif; ?>
                </span>
                <?php endif; ?>

                <span class="font-14 text-gray mt-5 selected_date font-weight-500"><?php echo e(trans('site.selected_date')); ?>: <span></span></span>
            </div>

            <div id="availableTimes" class="d-flex flex-wrap align-items-center mt-25">

            </div>

            <?php if(!$meeting->disabled): ?>
                <button type="submit" class="btn btn-sm btn-primary mt-30"><?php echo e(trans('meeting.reserve_appointment')); ?></button>
            <?php endif; ?>
        </form>
    </div>
<?php else: ?>

    <?php echo $__env->make(getTemplate() . '.includes.no-result',[
       'file_name' => 'meet.png',
       'title' => trans('site.instructor_not_available'),
       'hint' => '',
    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

<?php endif; ?>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/user/profile_tabs/appointments.blade.php ENDPATH**/ ?>