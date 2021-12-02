$.fn.commentCards = function () {

  return this.each(function () {

    var $this = $(this),
      $cards = $this.find('.comment-card'),
      $current = $cards.filter('.comment-card--current'),
      $next;

    $cards.on('click', function () {
      if (!$current.is(this)) {
        $cards.removeClass('comment-card--current comment-card--out comment-card--next');
        $current.addClass('comment-card--out');
        $current = $(this).addClass('comment-card--current');
        $next = $current.next();
        $next = $next.length ? $next : $cards.first();
        $next.addClass('comment-card--next');
      }
    });

    if (!$current.length) {
      $current = $cards.last();
      $cards.first().trigger('click');
    }

    $this.addClass('comment-cards--active');

  })

};
$('.comment-cards').commentCards();
export {commentCards};
