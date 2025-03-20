<div class="blog-grid-card">
    <div class="blog-grid-image">
        <img src="<?php echo e($post->image); ?>" class="img-cover" alt="<?php echo e($post->title); ?>">

        <span class="badge created-at d-flex align-items-center">
            <i data-feather="calendar" width="20" height="20" class="mr-5"></i>
            <span><?php echo e(dateTimeFormat($post->created_at, 'Y/m/d')); ?></span>
        </span>
    </div>
    <div class="blog-grid-detail">
        <a href="<?php echo e($post->getUrl()); ?>">
            <h3 class="blog-grid-title mt-10"><?php echo e($post->title); ?></h3>
        </a>

        <div class="mt-20 blog-grid-desc"><?php echo truncate($post->description, 160); ?></div>

        <div class="blog-grid-footer d-flex align-items-center justify-content-between mt-15">
            <span>
                <i data-feather="user" width="20" height="20" class=""></i>
                 <?php if(!empty($post->author->full_name)): ?>
                <span class="ml-5"><?php echo e($post->author->full_name); ?></span>
                 <?php endif; ?>
              </span>

            <span class="d-flex align-items-center">
                <i data-feather="message-square" width="20" height="20" class=""></i>
                <span class="ml-5"><?php echo e($post->comments_count); ?></span>
            </span>
        </div>
    </div>
</div>
<?php /**PATH C:\xampp\htdocs\lms\resources\views/web/default/blog/grid-list.blade.php ENDPATH**/ ?>