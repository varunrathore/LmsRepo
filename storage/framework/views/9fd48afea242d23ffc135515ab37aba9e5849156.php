<?php $__env->startSection('content'); ?>
    <section class="cart-banner position-relative text-center">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center text-center">
                <div class="col-12 col-md-9 col-lg-7">

                    <h1 class="font-30 text-white font-weight-bold"><?php echo e($post->title); ?></h1>

                    <div class="d-flex flex-column flex-sm-row align-items-center align-sm-items-start justify-content-between">
                        <span class="mt-10 mt-md-20 font-16 font-weight-500 text-white"><?php echo e(trans('public.created_by')); ?>

                            <?php if(!empty($post->author->full_name)): ?>
                            <span class="text-white text-decoration-underline"><?php echo e($post->author->full_name); ?></span>
                            <?php endif; ?>
                        </span>
                        <span class="mt-10 mt-md-20 font-16 font-weight-500 text-white"><?php echo e(trans('public.in')); ?>

                            <a href="<?php echo e($post->category->getUrl()); ?>" class="text-white text-decoration-underline"><?php echo e($post->category->title); ?></a>
                        </span>
                        <span class="mt-10 mt-md-20 font-16 font-weight-500 text-white"><?php echo e(dateTimeFormat($post->created_at, 'j F Y')); ?></span>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <section class="container mt-10 mt-md-40">
        <div class="row">
            <div class="col-12 col-lg-8">
                <div class="post-show mt-30">

                    <div class="post-img pb-30">
                        <img src="<?php echo e($post->image); ?>" alt="">
                    </div>

                    <?php echo nl2br($post->content); ?>

                </div>

                
                <?php echo $__env->make('web.default.includes.comments',[
                        'comments' => $post->comments,
                        'inputName' => 'blog_id',
                        'inputValue' => $post->id
                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                

            </div>
            <div class="col-12 col-lg-4">
            <?php if(!empty($post->author->full_name)): ?>
                <div class="rounded-lg shadow-sm mt-35 p-20 course-teacher-card d-flex align-items-center flex-column">
                    <div class="teacher-avatar mt-5">
                        <img src="<?php echo e($post->author->getAvatar()); ?>" class="img-cover" alt="">
                    </div>
                    <h3 class="mt-10 font-20 font-weight-bold text-secondary"><?php echo e($post->author->full_name); ?></h3>
                    <span class="mt-5 font-weight-500 font-14 text-gray"><?php echo e($post->author->role->caption); ?></span>

                    <div class="mt-25 d-flex align-items-center  w-100">
                        <a href="/blog?author=<?php echo e($post->author->id); ?>" class="btn btn-sm btn-primary btn-block px-15"><?php echo e(trans('public.author_posts')); ?></a>
                    </div>
                </div>
                <?php endif; ?>

                
                <div class="p-20 mt-30 rounded-sm shadow-lg border border-gray300">
                    <h3 class="category-filter-title font-16 font-weight-bold text-dark-blue"><?php echo e(trans('categories.categories')); ?></h3>

                    <div class="pt-15">
                        <?php $__currentLoopData = $blogCategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $blogCategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <a href="<?php echo e($blogCategory->getUrl()); ?>" class="font-14 text-dark-blue d-block mt-15"><?php echo e($blogCategory->title); ?></a>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>

                
                <div class="p-20 mt-30 rounded-sm shadow-lg border border-gray300">
                    <h3 class="category-filter-title font-20 font-weight-bold text-dark-blue"><?php echo e(trans('site.recent_posts')); ?></h3>

                    <div class="pt-15">

                        <?php $__currentLoopData = $popularPosts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $popularPost): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="popular-post d-flex align-items-start mt-20">
                                <div class="popular-post-image rounded">
                                    <img src="<?php echo e($popularPost->image); ?>" class="img-cover rounded" alt="<?php echo e($popularPost->title); ?>">
                                </div>
                                <div class="popular-post-content d-flex flex-column ml-10">
                                    <a href="<?php echo e($popularPost->getUrl()); ?>">
                                        <h3 class="font-14 text-dark-blue"><?php echo e(truncate($popularPost->title,40)); ?></h3>
                                    </a>
                                    <span class="mt-auto font-12 text-gray"><?php echo e(dateTimeFormat($popularPost->created_at, 'Y/m/d')); ?></span>
                                </div>
                            </div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        <a href="/blog" class="btn btn-sm btn-primary btn-block mt-30"><?php echo e(trans('home.view_all')); ?> <?php echo e(trans('site.posts')); ?></a>
                    </div>
                </div>

            </div>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts_bottom'); ?>
    <script>
        var webinarDemoLang = '<?php echo e(trans('webinars.webinar_demo')); ?>';
        var replyLang = '<?php echo e(trans('panel.reply')); ?>';
        var closeLang = '<?php echo e(trans('public.close')); ?>';
        var saveLang = '<?php echo e(trans('public.save')); ?>';
        var reportLang = '<?php echo e(trans('panel.report')); ?>';
        var reportSuccessLang = '<?php echo e(trans('panel.report_success')); ?>';
        var messageToReviewerLang = '<?php echo e(trans('public.message_to_reviewer')); ?>';
    </script>

    <script src="/assets/default/js/parts/comment.min.js"></script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make(getTemplate().'.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/u755557192/domains/nextnow.in/public_html/resources/views/web/default/blog/show.blade.php ENDPATH**/ ?>