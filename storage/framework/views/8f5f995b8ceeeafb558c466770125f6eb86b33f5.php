<div class="tab-pane mt-3 fade <?php if(empty(request()->get('page'))): ?> active show <?php endif; ?>" id="basic" role="tabpanel" aria-labelledby="basic-tab">
    <div class="row">
        <div class="col-12 col-md-6">
            <form action="/admin/settings/main" method="post">
                <?php echo e(csrf_field()); ?>

                <input type="hidden" name="page" value="financial">
                <input type="hidden" name="name" value="financial">


                <div class="form-group">
                    <label><?php echo e(trans('admin/main.default_commission')); ?></label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-percentage"></i>
                            </div>
                        </div>
                        <input type="number" name="value[commission]" value="<?php echo e((!empty($itemValue) and !empty($itemValue['commission'])) ? $itemValue['commission'] : old('commission')); ?>" class="form-control text-center" maxlength="3" min="0" max="100"/>
                    </div>
                    <div class="text-muted text-small mt-1"><?php echo e(trans('admin/main.default_commission_hint')); ?></div>
                </div>


                <div class="form-group">
                    <label><?php echo e(trans('admin/main.tax')); ?></label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-percentage"></i>
                            </div>
                        </div>
                        <input type="number" name="value[tax]" value="<?php echo e((!empty($itemValue) and !empty($itemValue['tax'])) ? $itemValue['tax'] : old('tax')); ?>" class="form-control text-center" maxlength="3" min="0" max="100"/>
                    </div>
                </div>


                <div class="form-group">
                    <label><?php echo e(trans('admin/main.minimum_payout_amount')); ?></label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                        </div>
                        <input type="number" name="value[minimum_payout]" value="<?php echo e((!empty($itemValue) and !empty($itemValue['minimum_payout'])) ? $itemValue['minimum_payout'] : old('minimum_payout')); ?>" class="form-control text-center" min="0"/>
                    </div>
                    <div class="text-muted text-small mt-1"><?php echo e(trans('admin/main.minimum_payout_amount_hint')); ?></div>
                </div>


                <div class="form-group">
                    <label class="input-label d-block"><?php echo e(trans('admin/main.currency')); ?></label>
                    <select name="value[currency]" class="form-control select2" data-placeholder="<?php echo e(trans('admin/main.currency')); ?>">
                        <option value=""></option>
                        <?php $__currentLoopData = currenciesLists(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $currency): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($key); ?>" <?php if((!empty($itemValue) and !empty($itemValue['currency'])) and $itemValue['currency'] == $key): ?> selected <?php endif; ?> ><?php echo e($currency); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>

                <button type="submit" class="btn btn-success"><?php echo e(trans('admin/main.save_change')); ?></button>
            </form>
        </div>
    </div>
</div>
<?php /**PATH /home/admin/domains/subs/go/resources/views/admin/settings/financial/basic.blade.php ENDPATH**/ ?>