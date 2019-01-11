Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2754726ywd;
        Fri, 11 Jan 2019 01:31:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4VDmLFFBOAYZLA34ZfDvbH5jgJGmSwDE7ogcaYIwCyjRZlMHgmdWdCBQswdAe9JVRr/zTI
X-Received: by 2002:a62:99dd:: with SMTP id t90mr13670589pfk.179.1547199090384;
        Fri, 11 Jan 2019 01:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199090; cv=none;
        d=google.com; s=arc-20160816;
        b=xu7zMF20zwg2T/w/9rvRyHs+dc2p6AEsN0PmWmEGvpNRCKuNC4D7a/E7Q7nV4DRqM6
         FGIV9BunSjQM98aHQCarYIh92b+KRqqKzE3NVUxirQRwTae2TmyKXdbcElbGR3P1kpLk
         YeQJDP/+e8CnRBrGD/X6Lhs/KnkfWWcM4C8vzz1uOez5B2Ia7K/zu8sI7BVMS6ElIyqx
         HUpFf/LM5UELgw5GcTORCA/AoSWb7QXHmN8Gfrq5b4uWvpRMc8YrewA7eD4ZClAiou0j
         biYYTeXWWimTR/9avNLfLgsJ/13irrnveMoZjiQpMseJ4Eywg61Nu8mxQ+3/RMqN9vSu
         B7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=FefdE9T4O66is3hFQmZks+DPkX9/iOiRXDgGi1eeIH0=;
        b=CoH+6yhLwmuwr2Hu2eU65waL7+EVQyEcXhZPxhoeM5PT+8jk4+jJhGF1axj5/PpCQ2
         J3j68FITd9113KUYGcO/X8m3VXQVxBOUcHB6WSq1xJNJX1iU0iSuMCQ7/fO0a3JYUFJ5
         ILVYBuk2cb92cufUXAfhse8v1XGEjUz+PNooMmC/oV4R92IckTgQs/ZhXkl3faX5T1Kq
         PKi20pPgnsGvwC1wkOgMRwupQSuStDUvXREjCm4rOijON+VX9Dob6jWDmDdQS/uEKygZ
         LKvWu1FpUTZFJgHhIC3sR0flqgPPXcx+APdwa1mBm9tl+Lv3kkJ4ZzMYCMR2vGk5YC1H
         8l/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j22si4863412pfi.252.2019.01.11.01.31.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:31:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5D56F5B8;
	Fri, 11 Jan 2019 09:31:29 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0166F5B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:31:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E40687EBBA;
 Fri, 11 Jan 2019 09:31:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDDA11019626;
 Fri, 11 Jan 2019 09:31:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7DFCD9AB2; Fri, 11 Jan 2019 10:31:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] [debug] some logging
Date: Fri, 11 Jan 2019 10:31:16 +0100
Message-Id: <20190111093116.17188-6-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-1-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 11 Jan 2019 09:31:27 +0000 (UTC)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

LS0tCiBody92ZmlvL2Rpc3BsYXkuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaHcvdmZpby9kaXNwbGF5LmMgYi9o
dy92ZmlvL2Rpc3BsYXkuYwppbmRleCBhM2E3MTBiM2VlLi45NmI1NDc0MjQzIDEwMDY0NAotLS0g
YS9ody92ZmlvL2Rpc3BsYXkuYworKysgYi9ody92ZmlvL2Rpc3BsYXkuYwpAQCAtNDIsNiArNDIs
OCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9saW5rX3VwKHZvaWQgKm9wYXF1ZSkK
ICAgICBWRklPUENJRGV2aWNlICp2ZGV2ID0gb3BhcXVlOwogICAgIFZGSU9EaXNwbGF5ICpkcHkg
PSB2ZGV2LT5kcHk7CiAKKyAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOlxuIiwgX19mdW5jX18pOwor
CiAgICAgZHB5LT5lZGlkX3JlZ3MtPmxpbmtfc3RhdGUgPSBWRklPX0RFVklDRV9HRlhfTElOS19T
VEFURV9VUDsKICAgICBwd3JpdGVfZmllbGQodmRldi0+dmJhc2VkZXYuZmQsIGRweS0+ZWRpZF9p
bmZvLCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSk7CiAgICAgcmV0dXJuOwpAQCAtNjAsNiAr
NjIsOSBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmlj
ZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZgogICAgICAgICAucHJlZnkgPSBwcmVmeSA/
OiB2ZGV2LT5kaXNwbGF5X3lyZXMsCiAgICAgfTsKIAorICAgIGZwcmludGYoc3RkZXJyLCAiJXM6
IHVpIGluZm86ICVkeCVkLCAlc1xuIiwgX19mdW5jX18sCisgICAgICAgICAgICBwcmVmeCwgcHJl
ZnksIGVuYWJsZWQgPyAib24iIDogIm9mZiIpOworCiAgICAgdGltZXJfZGVsKGRweS0+ZWRpZF9s
aW5rX3RpbWVyKTsKICAgICBkcHktPmVkaWRfcmVncy0+bGlua19zdGF0ZSA9IFZGSU9fREVWSUNF
X0dGWF9MSU5LX1NUQVRFX0RPV047CiAgICAgcHdyaXRlX2ZpZWxkKHZkZXYtPnZiYXNlZGV2LmZk
LCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3MsIGxpbmtfc3RhdGUpOwpAQCAtNzQsNiAr
NzksOSBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF91cGRhdGUoVkZJT1BDSURldmlj
ZSAqdmRldiwgYm9vbCBlbmFibGVkLCBpbnQgcHJlZgogICAgIGlmIChlZGlkLm1heHkgJiYgZWRp
ZC5wcmVmeSA+IGVkaWQubWF4eSkgewogICAgICAgICBlZGlkLnByZWZ5ID0gZWRpZC5tYXh5Owog
ICAgIH0KKyAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOiBlZGlkOiAlZHglZFxuIiwgX19mdW5jX18s
CisgICAgICAgICAgICBlZGlkLnByZWZ4LCBlZGlkLnByZWZ5KTsKKwogICAgIHFlbXVfZWRpZF9n
ZW5lcmF0ZShkcHktPmVkaWRfYmxvYiwKICAgICAgICAgICAgICAgICAgICAgICAgZHB5LT5lZGlk
X3JlZ3MtPmVkaWRfbWF4X3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICZlZGlkKTsKQEAg
LTEyMyw2ICsxMzEsOCBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9pbml0KFZGSU9Q
Q0lEZXZpY2UgKnZkZXYpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZGSU9f
UkVHSU9OX1NVQlRZUEVfR0ZYX0VESUQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZkcHktPmVkaWRfaW5mbyk7CiAgICAgaWYgKHJldCkgeworICAgICAgICBmcHJpbnRmKHN0
ZGVyciwgIiVzOiBubyBlZGlkIHJlZ2lvbiAoJXMpXG4iLAorICAgICAgICAgICAgICAgIF9fZnVu
Y19fLCBzdHJlcnJvcihlcnJubykpOwogICAgICAgICByZXR1cm47CiAgICAgfQogCkBAIC0xMzIs
NiArMTQyLDEyIEBAIHN0YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX2luaXQoVkZJT1BDSURl
dmljZSAqdmRldikKICAgICBwcmVhZF9maWVsZCh2ZGV2LT52YmFzZWRldi5mZCwgZHB5LT5lZGlk
X2luZm8sIGRweS0+ZWRpZF9yZWdzLCBtYXhfeHJlcyk7CiAgICAgcHJlYWRfZmllbGQodmRldi0+
dmJhc2VkZXYuZmQsIGRweS0+ZWRpZF9pbmZvLCBkcHktPmVkaWRfcmVncywgbWF4X3lyZXMpOwog
ICAgIGRweS0+ZWRpZF9ibG9iID0gZ19tYWxsb2MwKGRweS0+ZWRpZF9yZWdzLT5lZGlkX21heF9z
aXplKTsKKyAgICBmcHJpbnRmKHN0ZGVyciwgIiVzOiBlZGlkIHJlZ2lvbjogb2Zmc2V0ICVkLCBz
aXplICVkLCBtYXgtcmVzICVkeCVkXG4iLAorICAgICAgICAgICAgX19mdW5jX18sCisgICAgICAg
ICAgICBkcHktPmVkaWRfcmVncy0+ZWRpZF9vZmZzZXQsCisgICAgICAgICAgICBkcHktPmVkaWRf
cmVncy0+ZWRpZF9tYXhfc2l6ZSwKKyAgICAgICAgICAgIGRweS0+ZWRpZF9yZWdzLT5tYXhfeHJl
cywKKyAgICAgICAgICAgIGRweS0+ZWRpZF9yZWdzLT5tYXhfeXJlcyk7CiAKICAgICAvKiBpZiB4
cmVzICsgeXJlcyBwcm9wZXJ0aWVzIGFyZSB1bnNldCB1c2UgdGhlIG1heGltdW0gcmVzb2x1dGlv
biAqLwogICAgIGlmICghdmRldi0+ZGlzcGxheV94cmVzKQotLSAKMi45LjMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
