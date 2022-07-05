class TablesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tables = Table.where("user_id::text LIKE?", "#{current_user.id}")
  end

  def new
    @regular_works = RegularWork.where("user_id::text LIKE?", "#{current_user.id}")
    @deliver_works = DeliverWork.where("user_id::text LIKE?", "#{current_user.id}")
    @product_management_works = ProductManagementWork.where("user_id::text LIKE?", "#{current_user.id}")
    @cleaning_works = CleaningWork.where("user_id::text LIKE?", "#{current_user.id}")
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      flash[:notice] = "作業割当を新規登録しました"
      redirect_to :tables
    else
      render "new"
    end
  end

  def show
    @table = Table.find(params[:id])
  end

  def edit
    @regular_works = RegularWork.all
    @deliver_works = DeliverWork.all
    @product_management_works = ProductManagementWork.all
    @cleaning_works = CleaningWork.all
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])
    if @table.update(table_params)
      flash[:notice] = "IDが「#{@table.id}」の作業割当を更新しました"
      redirect_to :tables
    else
      render "edit"
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    flash[:notice] = "作業割当を削除しました"
    redirect_to :tables
  end

  def table_params
    params.require(:table).permit(:title, :user_id, :a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9, :a10, :a11, :a12, :a13, :a14, :a15, :a16, :a17, :a18, :a19, :a20, :a21, :a22, :a23, :a24, :a25, :a26, :a27, :a28, :a29, :a30, :a31, :a32, :a33, :a34, :a35, :a36, :a37, :a38, :a39, :a40, :a41, :a42, :a43, :a44, :a45, :a46, :a47, :a48, :a49, :a50, :a51, :a52, :a53, :a54, :a55, :a56, :a57, :a58, :a59, :a60, :a61, :a62, :a63, :a64, :a65, :a66, :a67, :a68, :a69, :a70, :a71, :a72, :a73, :a74, :a75, :a76, :a77, :a78, :a79, :a80, :a81, :a82, :a83, :a84, :a85, :a86, :a87, :a88, :a89, :a90, :a91, :a92, :a93, :a94, :a95, :a96, :b1, :b2, :b3, :b4, :b5, :b6, :b7, :b8, :b9, :b10, :b11, :b12, :b13, :b14, :b15, :b16, :b17, :b18, :b19, :b20, :b21, :b22, :b23, :b24, :b25, :b26, :b27, :b28, :b29, :b30, :b31, :b32, :b33, :b34, :b35, :b36, :b37, :b38, :b39, :b40, :b41, :b42, :b43, :b44, :b45, :b46, :b47, :b48, :b49, :b50, :b51, :b52, :b53, :b54, :b55, :b56, :b57, :b58, :b59, :b60, :b61, :b62, :b63, :b64, :b65, :b66, :b67, :b68, :b69, :b70, :b71, :b72, :b73, :b74, :b75, :b76, :b77, :b78, :b79, :b80, :b81, :b82, :b83, :b84, :b85, :b86, :b87, :b88, :b89, :b90, :b91, :b92, :b93, :b94, :b95, :b96, :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8, :c9, :c10, :c11, :c12, :c13, :c14, :c15, :c16, :c17, :c18, :c19, :c20, :c21, :c22, :c23, :c24, :c25, :c26, :c27, :c28, :c29, :c30, :c31, :c32, :c33, :c34, :c35, :c36, :c37, :c38, :c39, :c40, :c41, :c42, :c43, :c44, :c45, :c46, :c47, :c48, :c49, :c50, :c51, :c52, :c53, :c54, :c55, :c56, :c57, :c58, :c59, :c60, :c61, :c62, :c63, :c64, :c65, :c66, :c67, :c68, :c69, :c70, :c71, :c72, :c73, :c74, :c75, :c76, :c77, :c78, :c79, :c80, :c81, :c82, :c83, :c84, :c85, :c86, :c87, :c88, :c89, :c90, :c91, :c92, :c93, :c94, :c95, :c96, :d1, :d2, :d3, :d4, :d5, :d6, :d7, :d8, :d9, :d10, :d11, :d12, :d13, :d14, :d15, :d16, :d17, :d18, :d19, :d20, :d21, :d22, :d23, :d24, :d25, :d26, :d27, :d28, :d29, :d30, :d31, :d32, :d33, :d34, :d35, :d36, :d37, :d38, :d39, :d40, :d41, :d42, :d43, :d44, :d45, :d46, :d47, :d48, :d49, :d50, :d51, :d52, :d53, :d54, :d55, :d56, :d57, :d58, :d59, :d60, :d61, :d62, :d63, :d64, :d65, :d66, :d67, :d68, :d69, :d70, :d71, :d72, :d73, :d74, :d75, :d76, :d77, :d78, :d79, :d80, :d81, :d82, :d83, :d84, :d85, :d86, :d87, :d88, :d89, :d90, :d91, :d92, :d93, :d94, :d95, :d96)
  end
end
