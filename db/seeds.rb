# USER
user = Erp::User.first

# Diseases
puts "Create sample categories disease"
Erp::Diseases::Category.where(name: "ALS (Amyotroph Lateral Sclerosis)").destroy_all
category1 = Erp::Diseases::Category.create(
    name: "ALS (Amyotroph Lateral Sclerosis)",
    creator_id: user.id
)

Erp::Diseases::Category.where(name: "Corona virus").destroy_all
category2 = Erp::Diseases::Category.create(
    name: "Corona virus",
    creator_id: user.id
)

Erp::Diseases::Category.where(name: "Psoriasis").destroy_all
category3 = Erp::Diseases::Category.create(
    name: "Psoriasis",
    creator_id: user.id
)

Erp::Diseases::Category.where(name: "Eczema").destroy_all
category4 = Erp::Diseases::Category.create(
    name: "Eczema",
    creator_id: user.id
)

# ================================
puts "Create sample diseases"
Erp::Diseases::Disease.where(name: "ALS (Amyotroph Lateral Sclerosis)").destroy_all
article1 = Erp::Diseases::Disease.create(
    name: "ALS (Amyotroph Lateral Sclerosis)", 
    description: "Bệnh xơ cứng teo cơ một bên (hội chứng ALS) là một bệnh lý liên quan đến hệ thần kinh, xảy ra khi một số tế bào nơron ở não và tủy sống dần chết đi. Người bệnh ban đầu gặp những vấn đề liên quan đến cơ bắp, rồi dần trở thành tàn tật, đến cuối cùng, cơ hô hấp ngừng hoạt động, dẫn đến tử vong.", 
    definition: "
        <p>Bệnh xơ cứng teo cơ một bên, hay hội chứng ALS (Amyotrophic Lateral Sclerosis), là một bệnh lý liên quan đến hệ thống thần kinh, ảnh hưởng đến các tế bào thần kinh trong não và tủy sống, gây mất kiểm soát cơ bắp.</p>
        <p>Hội chứng ALS còn được gọi là bệnh “Lou Gehrig”- Tên của một cầu thủ bóng chày sau khi người này được chẩn đoán mắc bệnh nêu trên. Cho tới nay, nguyên nhân gây ra bệnh xơ cứng teo cơ một bên vẫn chưa được nghiên cứu đầy đủ. Một số trường hợp được cho là do di truyền.</p>
        <p>Bệnh thường bắt đầu với cơn co giật cơ, yếu ở một bên chi hoặc nói chậm. Bệnh xơ cứng teo cơ bên trái ảnh hưởng chủ yếu đến các nhóm cơ bên trái của cơ thể. Cuối cùng, bệnh ảnh hưởng đến toàn bộ quá trình kiểm soát các cơ cần thiết để di chuyển, nói, ăn và thở. Hiện nay chưa có cách điều trị cho căn bệnh này.</p>
    ", 
    reason: "
        <p>Hội chứng ALS ảnh hưởng đến các tế bào thần kinh có chức năng kiểm soát những chuyển động cơ bắp không ý thức, như đi bộ và nói chuyện (thuộc tế bào thần kinh vận động). Bệnh khiến cho các tế bào thần kinh vận động dần dần chết đi. Hệ thống tế bào thần kinh vận động kéo dài từ não đến tủy sống, đến các cơ dọc khắp cơ thể. Khi tế bào thần kinh vận động bị tổn thương, chúng sẽ chấm dứt quá trình dẫn truyền thông tin đến cơ bắp, vì vậy cơ bắp không thể hoạt động.</p>
        <p>5 - 10% các bệnh nhân mắc xơ cứng teo cơ một bên là do di truyền. Đối với các trường hợp còn lại, nguyên nhân gây bệnh chưa được biết đến.</p>
    ", 
    symptoms: "
        <p>Các dấu hiệu và triệu chứng của ALS thường rất khác nhau tùy theo từng người và tùy thuộc vào
            loại tế bào thần kinh nào bị ảnh hưởng. Các triệu chứng có thể bao gồm:
        </p>
        <ul>
            <li>- Khó khăn trong việc đi lại hoặc thực hiện các hoạt động bình thường hàng ngày;</li>
            <li>- Thường xuyên bị vấp, ngã;</li>
            <li>- Yếu ở chân, bàn chân hoặc mắt cá chân;</li>
            <li>- Tay yếu và vụng về;</li>
            <li>- Nói chậm, khó nuốt;</li>
            <li>- Chuột rút cơ bắp, co giật ở cánh tay, vai và lưỡi;</li>
            <li>- Khóc, cười hoặc ngáp không bình thường;</li>
            <li>- Thay đổi nhận thức và hành vi.</li>
        </ul>
        <br>
        <p>
            <b>Hội chứng ALS</b> thường bắt đầu ở bàn tay, bàn chân, sau đó lan sang nhiều bộ phận khác trên
            cơ thể. Khi bệnh bắt đầu tiến triển và các tế bào thần kinh bị phá hủy, cơ bắp của bệnh nhân sẽ
            yếu đi. Điều này gây ảnh hưởng nghiêm trọng đến việc nhai, nuốt, nói và hít thở.
        </p>
        <p>
            Nhìn chung, người bệnh hầu như không có cảm giác đau trong tất cả các giai đoạn của ALS. Hội
            chứng này cũng không ảnh hưởng đến hoạt động kiểm soát bàng quang hoặc các giác quan của cơ thể.
        </p>
    ", 
    treatment: "
        <p>Cơ quan Quản lý Thực phẩm và Dược phẩm Hoa Kỳ đã phê duyệt hai loại thuốc để <b>điều trị hội chứng ALS</b>:</p>
        <ul>
        <li>- Riluzole (biệt dược Rilutek): Dùng đường uống, đã được chứng minh là có khả năng làm tăng
            tuổi thọ từ 3 đến 6 tháng;</li>
        <li>- Edaravone (biệt dược Radicava): Dùng đường tiêm truyền tĩnh mạch, đã được chứng minh là có
            thể làm giảm diễn tiến suy giảm chức năng.</li>
        </ul>
    ", 
    category_id: category1.id, 
    creator_id: user.id
)

Erp::Diseases::Disease.where(name: "Corona virus").destroy_all
article2 = Erp::Diseases::Disease.create(
    name: "Corona virus", 
    description: "Bệnh Corona virus là một bệnh lý liên quan đến hệ thần kinh, xảy ra khi một số tế bào nơron ở não và tủy sống dần chết đi. Người bệnh ban đầu gặp những vấn đề liên quan đến cơ bắp, rồi dần trở thành tàn tật, đến cuối cùng, cơ hô hấp ngừng hoạt động, dẫn đến tử vong.", 
    definition: "
        <p>Bệnh xơ cứng teo cơ một bên, hay hội chứng ALS (Amyotrophic Lateral Sclerosis), là một bệnh lý liên quan đến hệ thống thần kinh, ảnh hưởng đến các tế bào thần kinh trong não và tủy sống, gây mất kiểm soát cơ bắp.</p>
        <p>Hội chứng ALS còn được gọi là bệnh “Lou Gehrig”- Tên của một cầu thủ bóng chày sau khi người này được chẩn đoán mắc bệnh nêu trên. Cho tới nay, nguyên nhân gây ra bệnh xơ cứng teo cơ một bên vẫn chưa được nghiên cứu đầy đủ. Một số trường hợp được cho là do di truyền.</p>
        <p>Bệnh thường bắt đầu với cơn co giật cơ, yếu ở một bên chi hoặc nói chậm. Bệnh xơ cứng teo cơ bên trái ảnh hưởng chủ yếu đến các nhóm cơ bên trái của cơ thể. Cuối cùng, bệnh ảnh hưởng đến toàn bộ quá trình kiểm soát các cơ cần thiết để di chuyển, nói, ăn và thở. Hiện nay chưa có cách điều trị cho căn bệnh này.</p>
    ", 
    reason: "
        <p>Hội chứng ALS ảnh hưởng đến các tế bào thần kinh có chức năng kiểm soát những chuyển động cơ bắp không ý thức, như đi bộ và nói chuyện (thuộc tế bào thần kinh vận động). Bệnh khiến cho các tế bào thần kinh vận động dần dần chết đi. Hệ thống tế bào thần kinh vận động kéo dài từ não đến tủy sống, đến các cơ dọc khắp cơ thể. Khi tế bào thần kinh vận động bị tổn thương, chúng sẽ chấm dứt quá trình dẫn truyền thông tin đến cơ bắp, vì vậy cơ bắp không thể hoạt động.</p>
        <p>5 - 10% các bệnh nhân mắc xơ cứng teo cơ một bên là do di truyền. Đối với các trường hợp còn lại, nguyên nhân gây bệnh chưa được biết đến.</p>
    ", 
    symptoms: "
        <p>Các dấu hiệu và triệu chứng của ALS thường rất khác nhau tùy theo từng người và tùy thuộc vào
            loại tế bào thần kinh nào bị ảnh hưởng. Các triệu chứng có thể bao gồm:
        </p>
        <ul>
            <li>- Khó khăn trong việc đi lại hoặc thực hiện các hoạt động bình thường hàng ngày;</li>
            <li>- Thường xuyên bị vấp, ngã;</li>
            <li>- Yếu ở chân, bàn chân hoặc mắt cá chân;</li>
            <li>- Tay yếu và vụng về;</li>
            <li>- Nói chậm, khó nuốt;</li>
            <li>- Chuột rút cơ bắp, co giật ở cánh tay, vai và lưỡi;</li>
            <li>- Khóc, cười hoặc ngáp không bình thường;</li>
            <li>- Thay đổi nhận thức và hành vi.</li>
        </ul>
        <br>
        <p>
            <b>Hội chứng ALS</b> thường bắt đầu ở bàn tay, bàn chân, sau đó lan sang nhiều bộ phận khác trên
            cơ thể. Khi bệnh bắt đầu tiến triển và các tế bào thần kinh bị phá hủy, cơ bắp của bệnh nhân sẽ
            yếu đi. Điều này gây ảnh hưởng nghiêm trọng đến việc nhai, nuốt, nói và hít thở.
        </p>
        <p>
            Nhìn chung, người bệnh hầu như không có cảm giác đau trong tất cả các giai đoạn của ALS. Hội
            chứng này cũng không ảnh hưởng đến hoạt động kiểm soát bàng quang hoặc các giác quan của cơ thể.
        </p>
    ", 
    treatment: "
        <p>Cơ quan Quản lý Thực phẩm và Dược phẩm Hoa Kỳ đã phê duyệt hai loại thuốc để <b>điều trị hội chứng ALS</b>:</p>
        <ul>
        <li>- Riluzole (biệt dược Rilutek): Dùng đường uống, đã được chứng minh là có khả năng làm tăng
            tuổi thọ từ 3 đến 6 tháng;</li>
        <li>- Edaravone (biệt dược Radicava): Dùng đường tiêm truyền tĩnh mạch, đã được chứng minh là có
            thể làm giảm diễn tiến suy giảm chức năng.</li>
        </ul>
    ", 
    category_id: category2.id, 
    creator_id: user.id
)

Erp::Diseases::Disease.where(name: "Psoriasis").destroy_all
article3 = Erp::Diseases::Disease.create(
    name: "Psoriasis", 
    description: "Bệnh Psoriasis là một bệnh lý liên quan đến hệ thần kinh, xảy ra khi một số tế bào nơron ở não và tủy sống dần chết đi. Người bệnh ban đầu gặp những vấn đề liên quan đến cơ bắp, rồi dần trở thành tàn tật, đến cuối cùng, cơ hô hấp ngừng hoạt động, dẫn đến tử vong.", 
    definition: "
        <p>Bệnh xơ cứng teo cơ một bên, hay hội chứng ALS (Amyotrophic Lateral Sclerosis), là một bệnh lý liên quan đến hệ thống thần kinh, ảnh hưởng đến các tế bào thần kinh trong não và tủy sống, gây mất kiểm soát cơ bắp.</p>
        <p>Hội chứng ALS còn được gọi là bệnh “Lou Gehrig”- Tên của một cầu thủ bóng chày sau khi người này được chẩn đoán mắc bệnh nêu trên. Cho tới nay, nguyên nhân gây ra bệnh xơ cứng teo cơ một bên vẫn chưa được nghiên cứu đầy đủ. Một số trường hợp được cho là do di truyền.</p>
        <p>Bệnh thường bắt đầu với cơn co giật cơ, yếu ở một bên chi hoặc nói chậm. Bệnh xơ cứng teo cơ bên trái ảnh hưởng chủ yếu đến các nhóm cơ bên trái của cơ thể. Cuối cùng, bệnh ảnh hưởng đến toàn bộ quá trình kiểm soát các cơ cần thiết để di chuyển, nói, ăn và thở. Hiện nay chưa có cách điều trị cho căn bệnh này.</p>
    ", 
    reason: "
        <p>Hội chứng ALS ảnh hưởng đến các tế bào thần kinh có chức năng kiểm soát những chuyển động cơ bắp không ý thức, như đi bộ và nói chuyện (thuộc tế bào thần kinh vận động). Bệnh khiến cho các tế bào thần kinh vận động dần dần chết đi. Hệ thống tế bào thần kinh vận động kéo dài từ não đến tủy sống, đến các cơ dọc khắp cơ thể. Khi tế bào thần kinh vận động bị tổn thương, chúng sẽ chấm dứt quá trình dẫn truyền thông tin đến cơ bắp, vì vậy cơ bắp không thể hoạt động.</p>
        <p>5 - 10% các bệnh nhân mắc xơ cứng teo cơ một bên là do di truyền. Đối với các trường hợp còn lại, nguyên nhân gây bệnh chưa được biết đến.</p>
    ", 
    symptoms: "
        <p>Các dấu hiệu và triệu chứng của ALS thường rất khác nhau tùy theo từng người và tùy thuộc vào
            loại tế bào thần kinh nào bị ảnh hưởng. Các triệu chứng có thể bao gồm:
        </p>
        <ul>
            <li>- Khó khăn trong việc đi lại hoặc thực hiện các hoạt động bình thường hàng ngày;</li>
            <li>- Thường xuyên bị vấp, ngã;</li>
            <li>- Yếu ở chân, bàn chân hoặc mắt cá chân;</li>
            <li>- Tay yếu và vụng về;</li>
            <li>- Nói chậm, khó nuốt;</li>
            <li>- Chuột rút cơ bắp, co giật ở cánh tay, vai và lưỡi;</li>
            <li>- Khóc, cười hoặc ngáp không bình thường;</li>
            <li>- Thay đổi nhận thức và hành vi.</li>
        </ul>
        <br>
        <p>
            <b>Hội chứng ALS</b> thường bắt đầu ở bàn tay, bàn chân, sau đó lan sang nhiều bộ phận khác trên
            cơ thể. Khi bệnh bắt đầu tiến triển và các tế bào thần kinh bị phá hủy, cơ bắp của bệnh nhân sẽ
            yếu đi. Điều này gây ảnh hưởng nghiêm trọng đến việc nhai, nuốt, nói và hít thở.
        </p>
        <p>
            Nhìn chung, người bệnh hầu như không có cảm giác đau trong tất cả các giai đoạn của ALS. Hội
            chứng này cũng không ảnh hưởng đến hoạt động kiểm soát bàng quang hoặc các giác quan của cơ thể.
        </p>
    ", 
    treatment: "
        <p>Cơ quan Quản lý Thực phẩm và Dược phẩm Hoa Kỳ đã phê duyệt hai loại thuốc để <b>điều trị hội chứng ALS</b>:</p>
        <ul>
        <li>- Riluzole (biệt dược Rilutek): Dùng đường uống, đã được chứng minh là có khả năng làm tăng
            tuổi thọ từ 3 đến 6 tháng;</li>
        <li>- Edaravone (biệt dược Radicava): Dùng đường tiêm truyền tĩnh mạch, đã được chứng minh là có
            thể làm giảm diễn tiến suy giảm chức năng.</li>
        </ul>
    ", 
    category_id: category3.id, 
    creator_id: user.id
)

Erp::Diseases::Disease.where(name: "Eczema").destroy_all
article4 = Erp::Diseases::Disease.create(
    name: "Eczema", 
    description: "Bệnh Eczema là một bệnh lý liên quan đến hệ thần kinh, xảy ra khi một số tế bào nơron ở não và tủy sống dần chết đi. Người bệnh ban đầu gặp những vấn đề liên quan đến cơ bắp, rồi dần trở thành tàn tật, đến cuối cùng, cơ hô hấp ngừng hoạt động, dẫn đến tử vong.", 
    definition: "
        <p>Bệnh xơ cứng teo cơ một bên, hay hội chứng ALS (Amyotrophic Lateral Sclerosis), là một bệnh lý liên quan đến hệ thống thần kinh, ảnh hưởng đến các tế bào thần kinh trong não và tủy sống, gây mất kiểm soát cơ bắp.</p>
        <p>Hội chứng ALS còn được gọi là bệnh “Lou Gehrig”- Tên của một cầu thủ bóng chày sau khi người này được chẩn đoán mắc bệnh nêu trên. Cho tới nay, nguyên nhân gây ra bệnh xơ cứng teo cơ một bên vẫn chưa được nghiên cứu đầy đủ. Một số trường hợp được cho là do di truyền.</p>
        <p>Bệnh thường bắt đầu với cơn co giật cơ, yếu ở một bên chi hoặc nói chậm. Bệnh xơ cứng teo cơ bên trái ảnh hưởng chủ yếu đến các nhóm cơ bên trái của cơ thể. Cuối cùng, bệnh ảnh hưởng đến toàn bộ quá trình kiểm soát các cơ cần thiết để di chuyển, nói, ăn và thở. Hiện nay chưa có cách điều trị cho căn bệnh này.</p>
    ", 
    reason: "
        <p>Hội chứng ALS ảnh hưởng đến các tế bào thần kinh có chức năng kiểm soát những chuyển động cơ bắp không ý thức, như đi bộ và nói chuyện (thuộc tế bào thần kinh vận động). Bệnh khiến cho các tế bào thần kinh vận động dần dần chết đi. Hệ thống tế bào thần kinh vận động kéo dài từ não đến tủy sống, đến các cơ dọc khắp cơ thể. Khi tế bào thần kinh vận động bị tổn thương, chúng sẽ chấm dứt quá trình dẫn truyền thông tin đến cơ bắp, vì vậy cơ bắp không thể hoạt động.</p>
        <p>5 - 10% các bệnh nhân mắc xơ cứng teo cơ một bên là do di truyền. Đối với các trường hợp còn lại, nguyên nhân gây bệnh chưa được biết đến.</p>
    ", 
    symptoms: "
        <p>Các dấu hiệu và triệu chứng của ALS thường rất khác nhau tùy theo từng người và tùy thuộc vào
            loại tế bào thần kinh nào bị ảnh hưởng. Các triệu chứng có thể bao gồm:
        </p>
        <ul>
            <li>- Khó khăn trong việc đi lại hoặc thực hiện các hoạt động bình thường hàng ngày;</li>
            <li>- Thường xuyên bị vấp, ngã;</li>
            <li>- Yếu ở chân, bàn chân hoặc mắt cá chân;</li>
            <li>- Tay yếu và vụng về;</li>
            <li>- Nói chậm, khó nuốt;</li>
            <li>- Chuột rút cơ bắp, co giật ở cánh tay, vai và lưỡi;</li>
            <li>- Khóc, cười hoặc ngáp không bình thường;</li>
            <li>- Thay đổi nhận thức và hành vi.</li>
        </ul>
        <br>
        <p>
            <b>Hội chứng ALS</b> thường bắt đầu ở bàn tay, bàn chân, sau đó lan sang nhiều bộ phận khác trên
            cơ thể. Khi bệnh bắt đầu tiến triển và các tế bào thần kinh bị phá hủy, cơ bắp của bệnh nhân sẽ
            yếu đi. Điều này gây ảnh hưởng nghiêm trọng đến việc nhai, nuốt, nói và hít thở.
        </p>
        <p>
            Nhìn chung, người bệnh hầu như không có cảm giác đau trong tất cả các giai đoạn của ALS. Hội
            chứng này cũng không ảnh hưởng đến hoạt động kiểm soát bàng quang hoặc các giác quan của cơ thể.
        </p>
    ", 
    treatment: "
        <p>Cơ quan Quản lý Thực phẩm và Dược phẩm Hoa Kỳ đã phê duyệt hai loại thuốc để <b>điều trị hội chứng ALS</b>:</p>
        <ul>
        <li>- Riluzole (biệt dược Rilutek): Dùng đường uống, đã được chứng minh là có khả năng làm tăng
            tuổi thọ từ 3 đến 6 tháng;</li>
        <li>- Edaravone (biệt dược Radicava): Dùng đường tiêm truyền tĩnh mạch, đã được chứng minh là có
            thể làm giảm diễn tiến suy giảm chức năng.</li>
        </ul>
    ", 
    category_id: category4.id, 
    creator_id: user.id
)