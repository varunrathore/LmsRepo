<?php $__env->startSection('content'); ?>
    <section class="section">
        <div class="section-header">
            <h1><?php echo e(trans('admin/main.subscribe_packages')); ?></h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="/admin/"><?php echo e(trans('admin/main.dashboard')); ?></a>
                </div>
                <div class="breadcrumb-item"><?php echo e(trans('admin/main.subscribe_packages')); ?></div>
            </div>
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped font-14">
                                    <tr>
                                        <th>#</th>
                                        <th class="text-left"><?php echo e(trans('admin/main.title')); ?></th>
                                        <th class="text-center"><?php echo e(trans('admin/main.price')); ?></th>
                                        <th class="text-center"><?php echo e(trans('admin/main.usable_count')); ?></th>
                                        <th class="text-center"><?php echo e(trans('public.days')); ?></th>
                                        <th class="text-center"><?php echo e(trans('admin/main.sale_count')); ?></th>
                                        <th class="text-center"><?php echo e(trans('admin/main.is_popular')); ?></th>
                                        <th class="text-center"><?php echo e(trans('admin/main.created_at')); ?></th>
                                        <th><?php echo e(trans('admin/main.actions')); ?></th>
                                    </tr>

                                    <?php $__currentLoopData = $subscribes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subscribe): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td>
                                                <img src="<?php echo e($subscribe->icon); ?>" width="50" height="50" alt="">
                                            </td>
                                            <td class="text-left"><?php echo e($subscribe->title); ?></td>
                                            <td class="text-center"><?php echo e($currency); ?><?php echo e($subscribe->price); ?></td>
                                            <td class="text-center"><?php echo e($subscribe->usable_count); ?></td>
                                            <td class="text-center"><?php echo e($subscribe->days); ?></td>
                                            <td class="text-center"><?php echo e($subscribe->sales->count()); ?></td>
                                            <td class="text-center">
                                                <?php if($subscribe->is_popular): ?>
                                                    <span class="text-success"><?php echo e(trans('admin/main.yes')); ?></span>
                                                <?php else: ?>
                                                    <span class=""><?php echo e(trans('admin/main.no')); ?></span>
                                                <?php endif; ?>
                                            </td>
                                            <td class="text-center"><?php echo e(dateTimeFormat($subscribe->created_at, 'Y M j | H:i')); ?></td>
                                            <td>
                                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('admin_subscribe_edit')): ?>
                                                    <a href="/admin/financial/subscribes/<?php echo e($subscribe->id); ?>/edit" class="btn-sm" data-toggle="tooltip" data-placement="top" title="<?php echo e(trans('admin/main.edit')); ?>">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                <?php endif; ?>

                                                <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('admin_subscribe_delete')): ?>
                                                    <?php echo $__env->make('admin.includes.delete_button',['url' => '/admin/financial/subscribes/'. $subscribe->id.'/delete','btnClass' => 'btn-sm'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                </table>
                            </div>
                        </div>

                        <div class="card-footer text-center">
                            <?php echo e($subscribes->links()); ?>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="card">
        <div class="card-body">
            <div class="section-title ml-0 mt-0 mb-3"><h5><?php echo e(trans('admin/main.hints')); ?></h5></div>
            <div class="row">
                <div class="col-md-6">
                    <div class="media-body">
                        <div class="text-primary mt-0 mb-1 font-weight-bold"><?php echo e(trans('admin/main.subscribes_list_hint_title_1')); ?></div>
                        <div class=" text-small font-600-bold"><?php echo e(trans('admin/main.subscribes_list_hint_description_1')); ?></div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="media-body">
                        <div class="text-primary mt-0 mb-1 font-weight-bold"><?php echo e(trans('admin/main.subscribes_list_hint_title_2')); ?></div>
                        <div class=" text-small font-600-bold"><?php echo e(trans('admin/main.subscribes_list_hint_description_2')); ?></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<?php $__env->stopSection(); ?>


<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/admin/financial/subscribes/lists.blade.php ENDPATH**/ ?>