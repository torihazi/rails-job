# ベースイメージ: Ruby 3.2.2
FROM ruby:3.2.2

# 必要最小限のパッケージをインストール
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  build-essential \
  vim \
  && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを設定
WORKDIR /app

# Gemfileをコピーしてインストール
COPY Gemfile Gemfile.lock ./

RUN bundle install

# # アプリケーションコードをコピー
COPY . .

# # ポートを公開
# EXPOSE 3000

# # Railsサーバーを起動
CMD ["rails", "server", "-b", "0.0.0.0"]