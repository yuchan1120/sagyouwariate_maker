# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_24_134021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tables", force: :cascade do |t|
    t.string "a1"
    t.string "a2"
    t.string "a3"
    t.string "a4"
    t.string "a5"
    t.string "a6"
    t.string "a7"
    t.string "a8"
    t.string "a9"
    t.string "a10"
    t.string "a11"
    t.string "a12"
    t.string "a13"
    t.string "a14"
    t.string "a15"
    t.string "a16"
    t.string "a17"
    t.string "a18"
    t.string "a19"
    t.string "a20"
    t.string "a21"
    t.string "a22"
    t.string "a23"
    t.string "a24"
    t.string "a25"
    t.string "a26"
    t.string "a27"
    t.string "a28"
    t.string "a29"
    t.string "a30"
    t.string "a31"
    t.string "a32"
    t.string "a33"
    t.string "a34"
    t.string "a35"
    t.string "a36"
    t.string "a37"
    t.string "a38"
    t.string "a39"
    t.string "a40"
    t.string "a41"
    t.string "a42"
    t.string "a43"
    t.string "a44"
    t.string "a45"
    t.string "a46"
    t.string "a47"
    t.string "a48"
    t.string "a49"
    t.string "a50"
    t.string "a51"
    t.string "a52"
    t.string "a53"
    t.string "a54"
    t.string "a55"
    t.string "a56"
    t.string "a57"
    t.string "a58"
    t.string "a59"
    t.string "a60"
    t.string "a61"
    t.string "a62"
    t.string "a63"
    t.string "a64"
    t.string "a65"
    t.string "a66"
    t.string "a67"
    t.string "a68"
    t.string "a69"
    t.string "a70"
    t.string "a71"
    t.string "a72"
    t.string "a73"
    t.string "a74"
    t.string "a75"
    t.string "a76"
    t.string "a77"
    t.string "a78"
    t.string "a79"
    t.string "a80"
    t.string "a81"
    t.string "a82"
    t.string "a83"
    t.string "a84"
    t.string "a85"
    t.string "a86"
    t.string "a87"
    t.string "a88"
    t.string "a89"
    t.string "a90"
    t.string "a91"
    t.string "a92"
    t.string "a93"
    t.string "a94"
    t.string "a95"
    t.string "a96"
    t.string "b1"
    t.string "b2"
    t.string "b3"
    t.string "b4"
    t.string "b5"
    t.string "b6"
    t.string "b7"
    t.string "b8"
    t.string "b9"
    t.string "b10"
    t.string "b11"
    t.string "b12"
    t.string "b13"
    t.string "b14"
    t.string "b15"
    t.string "b16"
    t.string "b17"
    t.string "b18"
    t.string "b19"
    t.string "b20"
    t.string "b21"
    t.string "b22"
    t.string "b23"
    t.string "b24"
    t.string "b25"
    t.string "b26"
    t.string "b27"
    t.string "b28"
    t.string "b29"
    t.string "b30"
    t.string "b31"
    t.string "b32"
    t.string "b33"
    t.string "b34"
    t.string "b35"
    t.string "b36"
    t.string "b37"
    t.string "b38"
    t.string "b39"
    t.string "b40"
    t.string "b41"
    t.string "b42"
    t.string "b43"
    t.string "b44"
    t.string "b45"
    t.string "b46"
    t.string "b47"
    t.string "b48"
    t.string "b49"
    t.string "b50"
    t.string "b51"
    t.string "b52"
    t.string "b53"
    t.string "b54"
    t.string "b55"
    t.string "b56"
    t.string "b57"
    t.string "b58"
    t.string "b59"
    t.string "b60"
    t.string "b61"
    t.string "b62"
    t.string "b63"
    t.string "b64"
    t.string "b65"
    t.string "b66"
    t.string "b67"
    t.string "b68"
    t.string "b69"
    t.string "b70"
    t.string "b71"
    t.string "b72"
    t.string "b73"
    t.string "b74"
    t.string "b75"
    t.string "b76"
    t.string "b77"
    t.string "b78"
    t.string "b79"
    t.string "b80"
    t.string "b81"
    t.string "b82"
    t.string "b83"
    t.string "b84"
    t.string "b85"
    t.string "b86"
    t.string "b87"
    t.string "b88"
    t.string "b89"
    t.string "b90"
    t.string "b91"
    t.string "b92"
    t.string "b93"
    t.string "b94"
    t.string "b95"
    t.string "b96"
    t.string "c1"
    t.string "c2"
    t.string "c3"
    t.string "c4"
    t.string "c5"
    t.string "c6"
    t.string "c7"
    t.string "c8"
    t.string "c9"
    t.string "c10"
    t.string "c11"
    t.string "c12"
    t.string "c13"
    t.string "c14"
    t.string "c15"
    t.string "c16"
    t.string "c17"
    t.string "c18"
    t.string "c19"
    t.string "c20"
    t.string "c21"
    t.string "c22"
    t.string "c23"
    t.string "c24"
    t.string "c25"
    t.string "c26"
    t.string "c27"
    t.string "c28"
    t.string "c29"
    t.string "c30"
    t.string "c31"
    t.string "c32"
    t.string "c33"
    t.string "c34"
    t.string "c35"
    t.string "c36"
    t.string "c37"
    t.string "c38"
    t.string "c39"
    t.string "c40"
    t.string "c41"
    t.string "c42"
    t.string "c43"
    t.string "c44"
    t.string "c45"
    t.string "c46"
    t.string "c47"
    t.string "c48"
    t.string "c49"
    t.string "c50"
    t.string "c51"
    t.string "c52"
    t.string "c53"
    t.string "c54"
    t.string "c55"
    t.string "c56"
    t.string "c57"
    t.string "c58"
    t.string "c59"
    t.string "c60"
    t.string "c61"
    t.string "c62"
    t.string "c63"
    t.string "c64"
    t.string "c65"
    t.string "c66"
    t.string "c67"
    t.string "c68"
    t.string "c69"
    t.string "c70"
    t.string "c71"
    t.string "c72"
    t.string "c73"
    t.string "c74"
    t.string "c75"
    t.string "c76"
    t.string "c77"
    t.string "c78"
    t.string "c79"
    t.string "c80"
    t.string "c81"
    t.string "c82"
    t.string "c83"
    t.string "c84"
    t.string "c85"
    t.string "c86"
    t.string "c87"
    t.string "c88"
    t.string "c89"
    t.string "c90"
    t.string "c91"
    t.string "c92"
    t.string "c93"
    t.string "c94"
    t.string "c95"
    t.string "c96"
    t.string "d1"
    t.string "d2"
    t.string "d3"
    t.string "d4"
    t.string "d5"
    t.string "d6"
    t.string "d7"
    t.string "d8"
    t.string "d9"
    t.string "d10"
    t.string "d11"
    t.string "d12"
    t.string "d13"
    t.string "d14"
    t.string "d15"
    t.string "d16"
    t.string "d17"
    t.string "d18"
    t.string "d19"
    t.string "d20"
    t.string "d21"
    t.string "d22"
    t.string "d23"
    t.string "d24"
    t.string "d25"
    t.string "d26"
    t.string "d27"
    t.string "d28"
    t.string "d29"
    t.string "d30"
    t.string "d31"
    t.string "d32"
    t.string "d33"
    t.string "d34"
    t.string "d35"
    t.string "d36"
    t.string "d37"
    t.string "d38"
    t.string "d39"
    t.string "d40"
    t.string "d41"
    t.string "d42"
    t.string "d43"
    t.string "d44"
    t.string "d45"
    t.string "d46"
    t.string "d47"
    t.string "d48"
    t.string "d49"
    t.string "d50"
    t.string "d51"
    t.string "d52"
    t.string "d53"
    t.string "d54"
    t.string "d55"
    t.string "d56"
    t.string "d57"
    t.string "d58"
    t.string "d59"
    t.string "d60"
    t.string "d61"
    t.string "d62"
    t.string "d63"
    t.string "d64"
    t.string "d65"
    t.string "d66"
    t.string "d67"
    t.string "d68"
    t.string "d69"
    t.string "d70"
    t.string "d71"
    t.string "d72"
    t.string "d73"
    t.string "d74"
    t.string "d75"
    t.string "d76"
    t.string "d77"
    t.string "d78"
    t.string "d79"
    t.string "d80"
    t.string "d81"
    t.string "d82"
    t.string "d83"
    t.string "d84"
    t.string "d85"
    t.string "d86"
    t.string "d87"
    t.string "d88"
    t.string "d89"
    t.string "d90"
    t.string "d91"
    t.string "d92"
    t.string "d93"
    t.string "d94"
    t.string "d95"
    t.string "d96"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.integer "user_id"
    t.boolean "default_data", default: false, null: false
  end

  create_table "taxons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "name"
    t.integer "time_required"
    t.integer "user_id"
    t.integer "taxon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "default_data", default: false, null: false
  end

end
