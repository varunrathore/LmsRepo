<!-- Modal -->
<div class="d-none" id="webinarPrerequisitesModal">
    <h3 class="section-title after-line font-20 text-dark-blue mb-25"><?php echo e(trans('public.add_prerequisites')); ?></h3>

    <form action="/admin/prerequisites/store" method="post">
        <input type="hidden" name="webinar_id" value="<?php echo e(!empty($webinar) ? $webinar->id :''); ?>">

        <div class="form-group mt-15">
            <label class="input-label d-block"><?php echo e(trans('public.select_prerequisites')); ?></label>
            <select id="prerequisitesSelect" name="prerequisite_id" class="form-control prerequisites-select" data-webinar-id="<?php echo e(!empty($webinar) ? $webinar->id : ''); ?>" data-placeholder="<?php echo e(trans('public.search_prerequisites')); ?>">

            </select>
            <div class="invalid-feedback"></div>
        </div>

        <div class="form-group mt-30 d-flex align-items-center justify-content-between">
            <label class="" for="str_requiredPrerequisitesSwitch"><?php echo e(trans('public.required')); ?></label>
            <div class="custom-control custom-switch">
                <input type="checkbox" name="required" class="custom-control-input" id="str_requiredPrerequisitesSwitch">
                <label class="custom-control-label" for="str_requiredPrerequisitesSwitch"></label>
            </div>
        </div>

        <div class="mt-30 d-flex align-items-center justify-content-end">
            <button type="button" id="savePrerequisites" class="btn btn-primary"><?php echo e(trans('public.save')); ?></button>
            <button type="button" class="btn btn-danger ml-2 close-swl"><?php echo e(trans('public.close')); ?></button>
        </div>
    </form>
</div>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/admin/webinars/modals/prerequisites.blade.php ENDPATH**/ ?>