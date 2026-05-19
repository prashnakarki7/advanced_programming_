<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Books | Nepal Reads Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageproduct.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .modal-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,.55);z-index:1000;align-items:center;justify-content:center}
        .modal-overlay.active{display:flex}
        .modal-box{background:#fff;border-radius:12px;padding:32px;width:600px;max-width:95vw;max-height:90vh;overflow-y:auto;position:relative}
        .modal-box h3{margin:0 0 20px;font-size:1.3rem}
        .modal-close{position:absolute;top:14px;right:16px;background:none;border:none;font-size:1.4rem;cursor:pointer;color:#555}
        .form-row{display:grid;grid-template-columns:1fr 1fr;gap:14px}
        .form-group{display:flex;flex-direction:column;gap:6px;margin-bottom:14px}
        .form-group label{font-weight:600;font-size:.87rem;color:#374151}
        .form-group input,.form-group select,.form-group textarea{padding:9px 12px;border:1px solid #d1d5db;border-radius:7px;font-size:.93rem;width:100%;box-sizing:border-box}
        .form-group textarea{resize:vertical;min-height:80px}
        .form-actions{display:flex;gap:10px;justify-content:flex-end;margin-top:8px}
        .btn-primary{background:#2563eb;color:#fff;border:none;padding:10px 22px;border-radius:7px;cursor:pointer;font-weight:600}
        .btn-secondary{background:#6b7280;color:#fff;border:none;padding:10px 22px;border-radius:7px;cursor:pointer;font-weight:600}
        .btn-primary:hover{background:#1d4ed8}
        #imagePreview{width:100%;max-height:180px;object-fit:contain;border:1px dashed #d1d5db;border-radius:8px;margin-top:6px;display:none}
        .notif{padding:12px 18px;border-radius:8px;margin-bottom:18px;font-weight:500}
        .notif.success{background:#dcfce7;color:#166534;border:1px solid #86efac}
        .notif.error{background:#fee2e2;color:#991b1b;border:1px solid #fca5a5}
        .book-thumb{width:44px;height:60px;object-fit:cover;border-radius:4px;border:1px solid #e5e7eb}
        .book-thumb-placeholder{width:44px;height:60px;background:#f3f4f6;border-radius:4px;display:flex;align-items:center;justify-content:center;color:#9ca3af;font-size:1.3rem;border:1px solid #e5e7eb}
    </style>
</head>
<body class="page-bg">

<jsp:include page="header.jsp" />

<div class="layout">
    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="sidebar-header">ADMIN<span>HUB</span></div>
        <a href="${pageContext.request.contextPath}/dashboard" class="nav-item"><i class="fas fa-th-large"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/manageuser" class="nav-item"><i class="fas fa-users"></i> Users</a>
        <a href="${pageContext.request.contextPath}/manageproduct" class="nav-item active"><i class="fas fa-book"></i> Books</a>
        <a href="${pageContext.request.contextPath}/manageorder" class="nav-item"><i class="fas fa-shopping-bag"></i> Orders</a>
        <a href="${pageContext.request.contextPath}/profile" class="nav-item"><i class="fas fa-user-edit"></i> Profile</a>
        <a href="${pageContext.request.contextPath}/logout" class="nav-item logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </nav>

    <!-- Main -->
    <div class="listing-container">
        <div class="admin-controls">
            <div>
                <h2>Book Inventory</h2>
                <p>Manage your book catalog — prices, images, stock and genres.</p>
            </div>
            <button class="btn-add-new" onclick="openAddModal()">
                <i class="fas fa-plus"></i> Add New Book
            </button>
        </div>

        <!-- Notification -->
        <c:if test="${not empty sessionScope.msg}">
            <div class="notif ${sessionScope.msg.contains('success') ? 'success' : 'error'}">
                <i class="fas fa-${sessionScope.msg.contains('success') ? 'check-circle' : 'exclamation-circle'}"></i>
                ${sessionScope.msg}
            </div>
            <c:remove var="msg" scope="session"/>
        </c:if>

        <main class="inventory-area">
            <table class="inventory-table">
                <thead>
                    <tr>
                        <th>Cover</th>
                        <th>Book Details</th>
                        <th>Genre</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty books}">
                            <tr><td colspan="6" style="text-align:center;padding:40px;color:#6b7280;">
                                <i class="fas fa-book-open" style="font-size:2rem;display:block;margin-bottom:10px"></i>
                                No books found. Add your first book!
                            </td></tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="b" items="${books}">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty b.coverImage}">
                                            <img src="${pageContext.request.contextPath}/${b.coverImage}"
                                                 class="book-thumb"
                                                 onerror="this.style.display='none';this.nextElementSibling.style.display='flex'"
                                                 alt="${b.title}">
                                            <div class="book-thumb-placeholder" style="display:none"><i class="fas fa-book"></i></div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="book-thumb-placeholder"><i class="fas fa-book"></i></div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="book-info">
                                        <div>
                                            <div class="book-title">${b.title}</div>
                                            <div class="book-author">${b.author}</div>
                                        </div>
                                    </div>
                                </td>
                                <td>${b.genre}</td>
                                <td>Rs. ${b.price}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${b.stock > 10}">
                                            <span class="stock-badge in-stock">${b.stock} in stock</span>
                                        </c:when>
                                        <c:when test="${b.stock > 0}">
                                            <span class="stock-badge" style="background:#fef3c7;color:#92400e">${b.stock} low</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="stock-badge" style="background:#fee2e2;color:#991b1b">Out of stock</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div class="action-btns">
                                        <button class="btn-edit" title="Edit"
                                            onclick="openEditModal(${b.bookId},'${b.title.replace("'","\\'")}','${b.author.replace("'","\\'")}','${b.isbn}','${b.genre}','${b.description.replace("'","\\'")}',${b.price},${b.stock},'${b.publishedDate}','${b.coverImage}')">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn-delete" title="Delete"
                                            onclick="confirmDelete(${b.bookId},'${b.title.replace("'","\\'")}')">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <div class="pagination">
                <p>Showing ${books.size()} books</p>
            </div>
        </main>
    </div>
</div>

<!-- ADD BOOK MODAL -->
<div class="modal-overlay" id="addModal">
    <div class="modal-box">
        <button class="modal-close" onclick="closeModal('addModal')">&times;</button>
        <h3><i class="fas fa-plus-circle"></i> Add New Book</h3>
        <form action="${pageContext.request.contextPath}/manageproduct" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
            <input type="hidden" name="action" value="add">
            <div class="form-row">
                <div class="form-group">
                    <label>Book Title *</label>
                    <input type="text" name="title" placeholder="e.g. The Alchemist" required>
                </div>
                <div class="form-group">
                    <label>Author *</label>
                    <input type="text" name="author" placeholder="e.g. Paulo Coelho" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>ISBN</label>
                    <input type="text" name="isbn" placeholder="978-XXXXXXXXXX">
                </div>
                <div class="form-group">
                    <label>Genre *</label>
                    <select name="genre" required>
                        <option value="">-- Select Genre --</option>
                        <option value="Fiction">Fiction</option>
                        <option value="Horror">Horror</option>
                        <option value="Romance">Romance</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Nepali Literature">Nepali Literature</option>
                        <option value="Science">Science</option>
                        <option value="History">History</option>
                        <option value="Business">Business</option>
                        <option value="Kids">Kids</option>
                        <option value="Self Help">Self Help</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Price (Rs.) *</label>
                    <input type="number" name="price" min="0" step="0.01" placeholder="850.00" required>
                </div>
                <div class="form-group">
                    <label>Stock *</label>
                    <input type="number" name="stock" min="0" placeholder="50" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Published Date</label>
                    <input type="date" name="publishedDate">
                </div>
                <div class="form-group">
                    <label>Cover Image</label>
                    <input type="file" name="coverImage" accept="image/*" onchange="previewImage(this,'addPreview')">
                    <img id="addPreview" src="" alt="Preview">
                </div>
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" placeholder="Brief description of the book..."></textarea>
            </div>
            <div class="form-actions">
                <button type="button" class="btn-secondary" onclick="closeModal('addModal')">Cancel</button>
                <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Add Book</button>
            </div>
        </form>
    </div>
</div>

<!-- EDIT BOOK MODAL -->
<div class="modal-overlay" id="editModal">
    <div class="modal-box">
        <button class="modal-close" onclick="closeModal('editModal')">&times;</button>
        <h3><i class="fas fa-edit"></i> Edit Book</h3>
        <form action="${pageContext.request.contextPath}/manageproduct" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="bookId" id="editBookId">
            <div class="form-row">
                <div class="form-group">
                    <label>Book Title *</label>
                    <input type="text" name="title" id="editTitle" required>
                </div>
                <div class="form-group">
                    <label>Author *</label>
                    <input type="text" name="author" id="editAuthor" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>ISBN</label>
                    <input type="text" name="isbn" id="editIsbn">
                </div>
                <div class="form-group">
                    <label>Genre *</label>
                    <select name="genre" id="editGenre" required>
                        <option value="Fiction">Fiction</option>
                        <option value="Horror">Horror</option>
                        <option value="Romance">Romance</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Nepali Literature">Nepali Literature</option>
                        <option value="Science">Science</option>
                        <option value="History">History</option>
                        <option value="Business">Business</option>
                        <option value="Kids">Kids</option>
                        <option value="Self Help">Self Help</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Price (Rs.) *</label>
                    <input type="number" name="price" id="editPrice" min="0" step="0.01" required>
                </div>
                <div class="form-group">
                    <label>Stock *</label>
                    <input type="number" name="stock" id="editStock" min="0" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label>Published Date</label>
                    <input type="date" name="publishedDate" id="editPublishedDate">
                </div>
                <div class="form-group">
                    <label>Cover Image (leave blank to keep existing)</label>
                    <input type="file" name="coverImage" accept="image/*" onchange="previewImage(this,'editPreview')">
                    <img id="editPreview" src="" alt="Preview">
                </div>
            </div>
            <div class="form-group">
                <label>Current Image Path</label>
                <input type="text" id="editCurrentImage" readonly style="background:#f9fafb;color:#6b7280;font-size:.8rem">
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" id="editDescription"></textarea>
            </div>
            <div class="form-actions">
                <button type="button" class="btn-secondary" onclick="closeModal('editModal')">Cancel</button>
                <button type="submit" class="btn-primary"><i class="fas fa-save"></i> Save Changes</button>
            </div>
        </form>
    </div>
</div>

<!-- DELETE CONFIRM MODAL -->
<div class="modal-overlay" id="deleteModal">
    <div class="modal-box" style="width:420px;text-align:center">
        <h3 style="color:#991b1b"><i class="fas fa-trash-alt"></i> Delete Book?</h3>
        <p id="deleteMsg" style="color:#4b5563;margin:12px 0 24px"></p>
        <form action="${pageContext.request.contextPath}/manageproduct" method="post">
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="bookId" id="deleteBookId">
            <div class="form-actions" style="justify-content:center">
                <button type="button" class="btn-secondary" onclick="closeModal('deleteModal')">Cancel</button>
                <button type="submit" class="btn-primary" style="background:#dc2626">Delete</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
function openAddModal() {
    document.getElementById('addModal').classList.add('active');
    document.getElementById('addPreview').style.display = 'none';
}
function openEditModal(id,title,author,isbn,genre,desc,price,stock,pubDate,img) {
    document.getElementById('editBookId').value = id;
    document.getElementById('editTitle').value  = title;
    document.getElementById('editAuthor').value = author;
    document.getElementById('editIsbn').value   = isbn;
    document.getElementById('editGenre').value  = genre;
    document.getElementById('editDescription').value = desc;
    document.getElementById('editPrice').value  = price;
    document.getElementById('editStock').value  = stock;
    document.getElementById('editPublishedDate').value = pubDate;
    document.getElementById('editCurrentImage').value  = img;
    var prev = document.getElementById('editPreview');
    if (img && img.trim() !== '') {
        prev.src = '${pageContext.request.contextPath}/' + img;
        prev.style.display = 'block';
    } else { prev.style.display = 'none'; }
    document.getElementById('editModal').classList.add('active');
}
function confirmDelete(id,title){
    document.getElementById('deleteBookId').value = id;
    document.getElementById('deleteMsg').textContent = 'Are you sure you want to delete "' + title + '"? This cannot be undone.';
    document.getElementById('deleteModal').classList.add('active');
}
function closeModal(id){ document.getElementById(id).classList.remove('active'); }
function previewImage(input,previewId){
    var prev = document.getElementById(previewId);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e){ prev.src = e.target.result; prev.style.display = 'block'; };
        reader.readAsDataURL(input.files[0]);
    }
}
function validateForm(form){
    var title = form.querySelector('[name="title"]').value.trim();
    var price = parseFloat(form.querySelector('[name="price"]').value);
    var stock = parseInt(form.querySelector('[name="stock"]').value);
    if(!title){ alert('Book title is required.'); return false; }
    if(isNaN(price) || price < 0){ alert('Please enter a valid price.'); return false; }
    if(isNaN(stock) || stock < 0){ alert('Please enter a valid stock quantity.'); return false; }
    return true;
}
// Close modal on overlay click
document.querySelectorAll('.modal-overlay').forEach(function(m){
    m.addEventListener('click', function(e){ if(e.target===m) m.classList.remove('active'); });
});
</script>
</body>
</html>
