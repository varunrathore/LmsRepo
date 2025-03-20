<?php $__env->startPush('styles_top'); ?>
    <link href="/assets/default/vendors/sortable/jquery-ui.min.css"/>
<?php $__env->stopPush(); ?>


<section class="mt-50">
    <div class="">
        <h2 class="section-title after-line"><?php echo e(trans('public.faq')); ?> (<?php echo e(trans('public.optional')); ?>)</h2>
    </div>

    <button id="webinarAddFAQ" data-webinar-id="<?php echo e($webinar->id); ?>" type="button" class="btn btn-primary btn-sm mt-15"><?php echo e(trans('public.add_faq')); ?></button>

    <div class="row mt-10">
        <div class="col-12">

            <div class="accordion-content-wrapper mt-15" id="faqsAccordion" role="tablist" aria-multiselectable="true">
                <?php if(!empty($webinar->faqs) and count($webinar->faqs)): ?>
                    <ul class="draggable-lists" data-order-table="faqs">
                        <?php $__currentLoopData = $webinar->faqs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $faqInfo): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php echo $__env->make('web.default.panel.webinar.create_includes.accordions.faq',['webinar' => $webinar,'faq' => $faqInfo], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                <?php else: ?>
                    <?php echo $__env->make(getTemplate() . '.includes.no-result',[
                        'file_name' => 'faq.png',
                        'title' => trans('public.faq_no_result'),
                        'hint' => trans('public.faq_no_result_hint'),
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <?php endif; ?>
            </div>
        </div>
    </div>
</section>

<div id="newFaqForm" class="d-none">
    <?php echo $__env->make('web.default.panel.webinar.create_includes.accordions.faq',['webinar' => $webinar], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</div>


<?php $__env->startPush('scripts_bottom'); ?>
    <script src="/assets/default/vendors/sortable/jquery-ui.min.js"></script>
<?php $__env->stopPush(); ?><?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/panel/webinar/create_includes/step_6.blade.php ENDPATH**/ ?>