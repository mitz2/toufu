import Vue from 'vue'

// var items = [
//   {
//     name: '鉛筆',
//     price: 300,
//     quantity:0
//   },
//   {
//     name: 'ノート',
//     price: 500,
//     quantity:0
//   }
// ]

// var vm = new Vue({
//   el: '#app',
//   data: {
//     items: items
//   },
//   filters: {
//     numDeli: function(value){
//       if(!value){
//         return '0'
//       }
//       return value.toString().replace(/(\d)(?=(\d{3})+$)/g,'$1,')
//     }
//   },
//   computed: {
//     total: function(){
//       return this.items.reduce(function(sum, item){
//         console.log(sum)
//         console.log(item)
//         return sum + (item.price * item.quantity)
//       }, 0)
//     },
//     canbuy: function(){
//       return this.total >= 1000
//     },
//     errorMessageStyle: function(){
//       return {
//         border: this.canbuy ? '' : '1px solid red',
//         color: this.canbuy ? '' : 'red'
//       }
//     }
//   }
// })
// window.vm = vm
new Vue({
  el: '#login_form_id',
  data: {
    emailError: '',
    passError: '',
    email_field: '',
    password_field: ''
  },
  methods: {
    // メールアドレスチェック
    emailChk: function(){
      this.emailNullChk
      this.emailError || this.emailErrChk 
    },
    // パスワードチェック
    passChk: function(){
      this.passNullChk
      this.passError || this.passErrChk
    },
    // ログインを押せる状態かチェックする
    loginChk: function(){
      return !this.emailError && !this.passError && this.email_field && this.password_field ? true : false
    }
  },
  computed: {
    // アドレス形式チェック
    emailErrChk: function(){
      const email_reg = /^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/
      this.emailError = email_reg.test(this.email_field) ? '' : 'アドレス形式が正しくありません'
    },
    // nullチェック
    emailNullChk: function(){
      this.emailError = this.email_field ? '' : 'メールアドレスは必須です。'
    },
    // 大小英数字桁数チェック
    passErrChk: function(){
      const pass_reg = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,}$/
      this.passError = pass_reg.test(this.password_field) ? '' : 'パスワードは大小英数字の８桁以上です。'
    },
    // nullチェック
    passNullChk: function(){
      this.passError = this.password_field ? '' : 'パスワードは必須です。'
    }
  }
})
