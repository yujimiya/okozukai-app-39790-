const date = () => {
  // 各日にクリックイベントを追加
  const calendarDays = document.querySelectorAll('.calendar-day');
  
  calendarDays.forEach(function(day) {
    day.addEventListener('click', function() {
      // クリックされた日付を取得
      const clickedDate = this.dataset.date;
      
      // Ajaxリクエストを作成
      const xhr = new XMLHttpRequest();
      xhr.open('POST', '/events', true);
      xhr.responseType = 'json';

      // CSRFトークンを取得
      const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

      // ヘッダーにCSRFトークンを追加
      xhr.setRequestHeader('Content-Type', 'application/json');
      xhr.setRequestHeader('X-CSRF-Token', csrfToken);
      
      // レスポンスを処理するコールバック関数
      xhr.onload = function() {
        if (xhr.status === 200) {
          console.log('イベントが作成されました');
          // イベントが作成された後の処理を追加
        } else {
          console.error('エラーが発生しました');
          // エラーが発生した場合の処理を追加
        }
      };
    
      // サーバーに送信するデータ
      const eventData = {
        help_date: clickedDate,
        // その他の必要なデータ
      };
      
      // リクエストを送信
      xhr.send(JSON.stringify(eventData));

      // 以下はクリックされた日付に対するUIの変更
      this.classList.toggle('marked');

      if (this.classList.contains('marked')) {
        this.style.backgroundColor = 'yellow';
      } else {
        this.style.backgroundColor = '';
      }
    });
  });
};

window.addEventListener('turbo:load', date);
window.addEventListener('turbo:render', date);