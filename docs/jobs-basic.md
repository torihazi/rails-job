# フェーズ 1: jobs-basic

最終更新日: 2025-11-07

## 目的

- ActiveJob の基本的なライフサイクルを理解する。
- Sidekiq を用いたジョブ実行と Redis キュー管理を体験する。
- Rails アプリからジョブを登録・監視する一連のハンズオンを進める土台を用意する。

## 学ぶべきこと

- ActiveJob の構造 (`perform_later`, ジョブクラス定義、キュー名指定)。
- Sidekiq のセットアップ方法 (Gem 導入、`sidekiq.yml`、Redis 接続設定)。
- Docker Compose での Rails・Sidekiq・Redis コンテナ連携。
- Rails コンソールやコントローラ/ビューからジョブをキューに投入する方法。
- Sidekiq Web UI によるジョブ監視の基本。

## 実装タスク

- [ ] Docker Compose に Rails/Sidekiq/Redis サービスを定義する。
- [ ] Rails アプリに Sidekiq 設定 (`config/sidekiq.yml`, `config/application.rb`) を追加する。
- [ ] `ActiveJob` を継承したサンプルジョブ (例: `HelloJob`) を作成し、`queue_as` を設定する。
- [ ] ジョブを起動するための Rake タスク、もしくはコントローラ + ビューを作成する。
- [ ] Sidekiq Web UI へアクセスするルートを設定し、ジョブの状態を確認する。
- [ ] README にジョブ起動手順と Sidekiq の確認方法を追記する。

## 動作確認チェック

- [ ] `docker compose up` で全サービスが起動する。
- [ ] Rails からジョブを投入し、Sidekiq のログで実行が確認できる。
- [ ] Sidekiq Web UI でジョブが `Processed` になる。
- [ ] 失敗時に Sidekiq が自動リトライしていることを確認する (任意)。

## 参考リンク

- Rails ガイド: Active Job Basics — https://railsguides.jp/active_job_basics.html
- Sidekiq Wiki (Getting Started) — https://github.com/sidekiq/sidekiq/wiki/Getting-Started
- Docker Compose Rails + Redis + Sidekiq 例 — https://docs.docker.com/samples/rails/
- Sidekiq Web UI — https://github.com/sidekiq/sidekiq/wiki/Monitoring

## メモ

- 学習の途中で得た知見や注意点を日付付きで追記する。
- 追加の資料リンクを見つけたら `参考リンク` に追記し、重複内容は統合する。

まず何をすれば良いのかな
job を使用したい。job を使用するためには何が必要なのかな。

とにかく generator を使用するなら rails g job "job 名"
こうすることで app/jobs 配下に job 名\_job.rb ができる
なお rails g job "ディレクトリ/job 名"とすることもできる

retry_on でリトライが可能で、例外で振り分けることが可能。
discard_on で捨てることが可能、そのエラーになったら以降処理はされずに終わる
また 1 つのクラスに retry_on と disacrd_on があった場合、下に書いていた方が優先される。

before_perform とか arround_perform とかあるけど、多分これやるくらいなら使わない方が良いと思う

retry_on とかは使えると思う。

retry_on
rails v7.0 以前 :exponentially_longer
以降 polynomially_longer

基本は perform_later で、あと引数か。

それ以外はキュー名の設定、priority、backend 設定、ビジネスロジック、retry_on とかの設定だ。
