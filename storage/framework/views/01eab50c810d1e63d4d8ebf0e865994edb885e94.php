<?php $__env->startPush('styles_top'); ?>
    <link rel="stylesheet" href="/assets/default/vendors/daterangepicker/daterangepicker.min.css">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <section>
        <h2 class="section-title"><?php echo e(trans('panel.meeting_statistics')); ?></h2>

        <div class="activities-container mt-25 p-20 p-lg-35">
            <div class="row">
                <div class="col-4 d-flex align-items-center justify-content-center">
                    <div class="d-flex flex-column align-items-center text-center">
                        <img src="/assets/default/img/activity/49.svg" width="64" height="64" alt="">
                        <strong class="font-30 font-weight-bold mt-5"><?php echo e($openReserveCount); ?></strong>
                        <span class="font-16 text-dark-blue text-gray font-weight-500"><?php echo e(trans('panel.open_meetings')); ?></span>
                    </div>
                </div>

                <div class="col-4 d-flex align-items-center justify-content-center">
                    <div class="d-flex flex-column align-items-center text-center">
                        <img src="/assets/default/img/activity/50.svg" width="64" height="64" alt="">
                        <strong class="font-30 font-weight-bold mt-5"><?php echo e($totalReserveCount); ?></strong>
                        <span class="font-16 text-dark-blue text-gray font-weight-500"><?php echo e(trans('panel.total_meetings')); ?></span>
                    </div>
                </div>

                <div class="col-4 d-flex align-items-center justify-content-center">
                    <div class="d-flex flex-column align-items-center text-center">
                        <img src="/assets/default/img/activity/hours.svg" width="64" height="64" alt="">
                        <strong class="font-30 text-dark-blue font-weight-bold mt-5"><?php echo e($activeHoursCount); ?></strong>
                        <span class="font-16 text-gray font-weight-500"><?php echo e(trans('panel.active_hours')); ?></span>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="mt-25">
        <h2 class="section-title"><?php echo e(trans('panel.filter_meetings')); ?></h2>

        <div class="panel-section-card py-20 px-25 mt-20">
            <form action="/panel/meetings/reservation" method="get" class="row">
                <div class="col-12 col-lg-4">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label class="input-label"><?php echo e(trans('public.from')); ?></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="dateInputGroupPrepend">
                                            <i data-feather="calendar" width="18" height="18" class="text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" name="from" autocomplete="off" class="form-control <?php if(!empty(request()->get('from'))): ?> datepicker <?php else: ?> datefilter <?php endif; ?>"
                                           aria-describedby="dateInputGroupPrepend" value="<?php echo e(request()->get('from','')); ?>"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="form-group">
                                <label class="input-label"><?php echo e(trans('public.to')); ?></label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="dateInputGroupPrepend">
                                            <i data-feather="calendar" width="18" height="18" class="text-white"></i>
                                        </span>
                                    </div>
                                    <input type="text" name="to" autocomplete="off" class="form-control <?php if(!empty(request()->get('to'))): ?> datepicker <?php else: ?> datefilter <?php endif; ?>"
                                           aria-describedby="dateInputGroupPrepend" value="<?php echo e(request()->get('to','')); ?>"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="row">
                        <div class="col-12 col-lg-4">
                            <div class="form-group">
                                <label class="input-label"><?php echo e(trans('public.day')); ?></label>
                                <select class="form-control" id="day" name="day">
                                    <option value="all"><?php echo e(trans('public.all_days')); ?></option>
                                    <option value="saturday" <?php echo e((request()->get('day') === "saturday") ? 'selected' : ''); ?>><?php echo e(trans('public.saturday')); ?></option>
                                    <option value="sunday" <?php echo e((request()->get('day') === "sunday") ? 'selected' : ''); ?>><?php echo e(trans('public.sunday')); ?></option>
                                    <option value="monday" <?php echo e((request()->get('day') === "monday") ? 'selected' : ''); ?>><?php echo e(trans('public.monday')); ?></option>
                                    <option value="tuesday" <?php echo e((request()->get('day') === "tuesday") ? 'selected' : ''); ?>><?php echo e(trans('public.tuesday')); ?></option>
                                    <option value="wednesday" <?php echo e((request()->get('day') === "wednesday") ? 'selected' : ''); ?>><?php echo e(trans('public.wednesday')); ?></option>
                                    <option value="thursday" <?php echo e((request()->get('day') === "thursday") ? 'selected' : ''); ?>><?php echo e(trans('public.thursday')); ?></option>
                                    <option value="friday" <?php echo e((request()->get('day') === "friday") ? 'selected' : ''); ?>><?php echo e(trans('public.friday')); ?></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 col-lg-8">
                            <div class="row">
                                <div class="col-12 col-lg-8">
                                    <div class="form-group">
                                        <label class="input-label"><?php echo e(trans('public.instructor')); ?></label>
                                        <select name="instructor_id" class="form-control select2 ">
                                            <option value="all"><?php echo e(trans('webinars.all_instructors')); ?></option>

                                            <?php $__currentLoopData = $instructors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $instructor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($instructor->id); ?>" <?php if(request()->get('instructor_id') == $instructor->id): ?> selected <?php endif; ?>><?php echo e($instructor->full_name); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-4">
                                    <div class="form-group">
                                        <label class="input-label"><?php echo e(trans('public.status')); ?></label>
                                        <select class="form-control" id="status" name="status">
                                            <option><?php echo e(trans('public.all')); ?></option>
                                            <option value="open" <?php echo e((request()->get('status') === "open") ? 'selected' : ''); ?>><?php echo e(trans('public.open')); ?></option>
                                            <option value="finished" <?php echo e((request()->get('status') === "finished") ? 'selected' : ''); ?>><?php echo e(trans('public.finished')); ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-2 d-flex align-items-center justify-content-end">
                    <button type="submit" class="btn btn-sm btn-primary w-100 mt-2"><?php echo e(trans('public.show_results')); ?></button>
                </div>
            </form>
        </div>
    </section>


    <section class="mt-35">
        <div class="d-flex align-items-start align-items-md-center justify-content-between flex-column flex-md-row">
            <h2 class="section-title"><?php echo e(trans('panel.meeting_list')); ?></h2>

            <form action="/panel/meetings/reservation?<?php echo e(http_build_query(request()->all())); ?>" class="d-flex align-items-center flex-row-reverse flex-md-row justify-content-start justify-content-md-center mt-20 mt-md-0">
                <label class="cursor-pointer mb-0 mr-10 text-gray font-14 font-weight-500" for="openMeetingResult"><?php echo e(trans('panel.show_only_open_meetings')); ?></label>
                <div class="custom-control custom-switch">
                    <input type="checkbox" name="open_meetings" class="js-panel-list-switch-filter custom-control-input" id="openMeetingResult" <?php echo e((request()->get('open_meetings', '') == 'on') ? 'checked' : ''); ?>>
                    <label class="custom-control-label" for="openMeetingResult"></label>
                </div>
            </form>
        </div>

        <?php if($reserveMeetings->count() > 0): ?>

            <div class="panel-section-card py-20 px-25 mt-20">
                <div class="row">
                    <div class="col-12 ">
                        <div class="table-responsive">
                            <table class="table text-center custom-table">
                                <thead>
                                <tr>
                                    <th><?php echo e(trans('public.instructor')); ?></th>
                                    <th class="text-center"><?php echo e(trans('public.day')); ?></th>
                                    <th class="text-center"><?php echo e(trans('public.date')); ?></th>
                                    <th class="text-center"><?php echo e(trans('public.time')); ?></th>
                                    <th class="text-center"><?php echo e(trans('public.paid_amount')); ?></th>
                                    <th class="text-center"><?php echo e(trans('public.status')); ?></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>

                                <?php $__currentLoopData = $reserveMeetings; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ReserveMeeting): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td class="text-left">
                                            <div class="user-inline-avatar d-flex align-items-center">
                                                <div class="avatar">
                                                    <img src="<?php echo e($ReserveMeeting->meeting->creator->getAvatar()); ?>" class="img-cover" alt="">
                                                </div>
                                                <div class=" ml-5">
                                                    <span class="d-block font-weight-500"><?php echo e($ReserveMeeting->meeting->creator->full_name); ?></span>
                                                    <span class="mt-5 font-12 text-gray d-block"><?php echo e($ReserveMeeting->meeting->creator->email); ?></span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <span class="font-weight-500"><?php echo e($ReserveMeeting->meetingTime->day_label); ?></span>
                                        </td>
                                        <td class="align-middle">
                                            <span><?php echo e(dateTimeFormat(strtotime($ReserveMeeting->day), 'd M Y')); ?></span>
                                        </td>
                                        <td class="align-middle">
                                            <span class="rounded bg-gray200 py-5 px-15 font-14 font-weight-500"><?php echo e($ReserveMeeting->meetingTime->time); ?></span>
                                        </td>
                                        <td class="align-middle font-weight-500">
                                            <?php if(!empty($ReserveMeeting->sale) and !empty($ReserveMeeting->sale->total_amount) and $ReserveMeeting->sale->total_amount > 0): ?>
                                                <?php echo e($currency); ?><?php echo e($ReserveMeeting->sale->total_amount); ?>


                                            <?php else: ?>
                                                <?php echo e(trans('public.free')); ?>

                                            <?php endif; ?>
                                        </td>
                                        <td class="align-middle">
                                            <?php switch($ReserveMeeting->status):
                                                case (\App\Models\ReserveMeeting::$pending): ?>
                                                <span class="text-warning font-weight-500"><?php echo e(trans('public.pending')); ?></span>
                                                <?php break; ?>
                                                <?php case (\App\Models\ReserveMeeting::$open): ?>
                                                <span class="text-gray font-weight-500"><?php echo e(trans('public.open')); ?></span>
                                                <?php break; ?>
                                                <?php case (\App\Models\ReserveMeeting::$finished): ?>
                                                <span class="font-weight-500 text-primary"><?php echo e(trans('public.finished')); ?></span>
                                                <?php break; ?>
                                                <?php case (\App\Models\ReserveMeeting::$canceled): ?>
                                                <span class="text-danger font-weight-500"><?php echo e(trans('public.canceled')); ?></span>
                                                <?php break; ?>
                                            <?php endswitch; ?>
                                        </td>


                                        <td class="align-middle text-right">
                                            <?php if($ReserveMeeting->status != \App\Models\ReserveMeeting::$finished): ?>

                                                <input type="hidden" class="js-meeting-password-<?php echo e($ReserveMeeting->id); ?>" value="<?php echo e($ReserveMeeting->password); ?>">
                                                <input type="hidden" class="js-meeting-link-<?php echo e($ReserveMeeting->id); ?>" value="<?php echo e($ReserveMeeting->link); ?>">


                                                <div class="btn-group dropdown table-actions">
                                                    <button type="button" class="btn-transparent dropdown-toggle"
                                                            data-toggle="dropdown" aria-haspopup="true"
                                                            aria-expanded="false">
                                                        <i data-feather="more-vertical" height="20"></i>
                                                    </button>
                                                    <div class="dropdown-menu menu-lg">
                                                        <?php if($ReserveMeeting->link and $ReserveMeeting->status == \App\Models\ReserveMeeting::$open): ?>
                                                            <button type="button" data-reserve-id="<?php echo e($ReserveMeeting->id); ?>"
                                                                    class="js-join-reserve btn-transparent webinar-actions d-block mt-10"><?php echo e(trans('footer.join')); ?></button>
                                                        <?php endif; ?>

                                                        <a href="<?php echo e($ReserveMeeting->addToCalendarLink()); ?>" target="_blank"
                                                           class="webinar-actions d-block mt-10 font-weight-normal"><?php echo e(trans('public.add_to_calendar')); ?></a>

                                                        <button type="button" data-user-id="<?php echo e($ReserveMeeting->meeting->creator_id); ?>" data-user-type="instructor"
                                                                class="contact-info btn-transparent webinar-actions d-block mt-10"><?php echo e(trans('panel.contact_instructor')); ?></button>

                                                        <button type="button" data-id="<?php echo e($ReserveMeeting->id); ?>" class="webinar-actions js-finish-meeting-reserve d-block btn-transparent mt-10 font-weight-normal"><?php echo e(trans('panel.finish_meeting')); ?></button>
                                                    </div>
                                                </div>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="my-30">
                <?php echo e($reserveMeetings->links('vendor.pagination.panel')); ?>

            </div>
        <?php else: ?>
            <?php echo $__env->make(getTemplate() . '.includes.no-result',[
                'file_name' => 'meeting.png',
                'title' => trans('panel.meeting_no_result'),
                'hint' => nl2br(trans('panel.meeting_no_result_hint')),
            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <?php endif; ?>
    </section>

    <?php echo $__env->make('web.default.panel.meeting.join_modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts_bottom'); ?>
    <script>
        var instructor_contact_information_lang = '<?php echo e(trans('panel.instructor_contact_information')); ?>';
        var student_contact_information_lang = '<?php echo e(trans('panel.student_contact_information')); ?>';
        var email_lang = '<?php echo e(trans('public.email')); ?>';
        var phone_lang = '<?php echo e(trans('public.phone')); ?>';
        var close_lang = '<?php echo e(trans('public.close')); ?>';
        var finishReserveHint = '<?php echo e(trans('meeting.finish_reserve_modal_hint')); ?>';
        var finishReserveConfirm = '<?php echo e(trans('meeting.finish_reserve_modal_confirm')); ?>';
        var finishReserveCancel = '<?php echo e(trans('meeting.finish_reserve_modal_cancel')); ?>';
        var finishReserveTitle = '<?php echo e(trans('meeting.finish_reserve_modal_title')); ?>';
        var finishReserveSuccess = '<?php echo e(trans('meeting.finish_reserve_modal_success')); ?>';
        var finishReserveSuccessHint = '<?php echo e(trans('meeting.finish_reserve_modal_success_hint')); ?>';
        var finishReserveFail = '<?php echo e(trans('meeting.finish_reserve_modal_fail')); ?>';
        var finishReserveFailHint = '<?php echo e(trans('meeting.finish_reserve_modal_fail_hint')); ?>';

    </script>
    <script src="/assets/default/vendors/daterangepicker/daterangepicker.min.js"></script>
    <script src="/assets/default/js/panel/meeting/contact-info.min.js"></script>
    <script src="/assets/default/js/panel/meeting/reserve_meeting.min.js"></script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make(getTemplate() .'.panel.layouts.panel_layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/panel/meeting/reservation.blade.php ENDPATH**/ ?>