<div class=" mt-3 ">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">

                    <form action="/admin/settings/home_sections" method="post">
                        <?php echo e(csrf_field()); ?>


                        <input type="hidden" name="page" value="personalization">

                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div id="addAccountTypes" class="ml-3">

                                    <?php
                                        $sections = [
                                                'latest_classes',
                                                'best_sellers',
                                                'free_classes',
                                                'discount_classes',
                                                'best_rates',
                                                'trend_categories',
                                                'testimonials',
                                                'subscribes',
                                                'blog',
                                                'organizations',
                                                'instructors',
                                                'video_or_image_section',
                                        ];
                                    ?>

                                    <?php $__currentLoopData = $sections; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $section): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="form-group custom-switches-stacked">
                                            <label class="custom-switch pl-0">
                                                <input type="hidden" name="value[<?php echo e($section); ?>]" value="0">
                                                <input type="checkbox" name="value[<?php echo e($section); ?>]" id="<?php echo e($section); ?>Switch" value="1" <?php echo e((!empty($itemValue) and !empty($itemValue[$section]) and $itemValue[$section]) ? 'checked="checked"' : ''); ?> class="custom-switch-input"/>
                                                <span class="custom-switch-indicator"></span>
                                                <label class="custom-switch-description mb-0 cursor-pointer" for="<?php echo e($section); ?>Switch"><?php echo e(trans('admin/main.'.$section)); ?></label>
                                            </label>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success"><?php echo e(trans('admin/main.save_change')); ?></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/admin/settings/personalization/home_sections.blade.php ENDPATH**/ ?>