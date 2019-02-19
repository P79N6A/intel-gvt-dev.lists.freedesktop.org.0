Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3019302ywa;
        Mon, 18 Feb 2019 23:29:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYwDUHzwdHi33l7zFQu/lHMYQY5ufRBkJFp+BuJDwgCrBKXZPIZdiyMft6nE4RI1/GmtDCi
X-Received: by 2002:a17:902:468:: with SMTP id 95mr28342493ple.73.1550561387633;
        Mon, 18 Feb 2019 23:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550561387; cv=none;
        d=google.com; s=arc-20160816;
        b=TDaGUUsG9KvNYoKpItve1JWEq7VTgQCs1OvbsyejaeS4WVzMusih1qFWWVCS1tJhZH
         o9XXlHwRgbUEFJbZXG6YnB0YjMbYawxOKPyCNZU+pmcMulVvfksAEhQaiWsTgosqTizq
         zh21pTIS0CKO2q9xVxu/x1UccNeA//kN8qv2pYJ54HzFQj/ZTaQeZoZPKRPQON0OjqUW
         upwxIUvf0prTdGcT0yXpE/BHDoGUP8XHiYlc0DILUk0zsGG+8oSxk52BoU+5JCjIUtU0
         JXSe6CRLgusq6LcvMlr1ziiXsQBqRktCeJXUWlzJ4XtuQu75H5VxFAA1pwGXewQnuz8L
         LPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=Ap9e9VBVT5J26z4kuVYQFHcfGwlD4Y0aMlo7+kztzgU=;
        b=Drs+48JZUL0tCgaEMlHYfo7IEIzshVCxq8/BDXBuBu1NtWKBCkWCmxBNKLklf6FFKm
         FFQixse4H17FyxeleFWxHIuicBOT1mtjJK7yOp2n/jCR5bsopMrPYe015Bx0vi+RkGro
         +OnjUnsnbIxd7L4dOfeQ6a0isXbIvfRBYBMXyXB8jXfD9W1pkSZ6Ul7c20dEkCaV23Sw
         XhwafS7ROPOMALmJ4dsm/HsBOsDbBZF6Mj8pYaviWItkCmAEPFHAc1BXng8lYGnYWgN4
         QjJQJTe2QGMHvtUfRgA4QTKCq32TCWNgV3QBImuzM0148UOryIACxu7NOSb5SJvNxtKd
         VKsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 61si12678836plc.364.2019.02.18.23.29.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:29:47 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F618890DB;
	Tue, 19 Feb 2019 07:29:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B15D890DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:29:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="276083344"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2019 23:29:44 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 4/8] drm/i915/gvt: Retrieve the guest gm base address from
 PVINFO
Date: Tue, 19 Feb 2019 02:24:29 -0500
Message-Id: <20190219072429.13735-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219071914.13424-1-yan.y.zhao@intel.com>
References: <20190219071914.13424-1-yan.y.zhao@intel.com>
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
Cc: Yulei Zhang <yulei.zhang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGludGVsLmNvbT4KCkFzIGFmdGVyIG1pZ3Jh
dGlvbiB0aGUgaG9zdCBnbSBiYXNlIGFkZHJlc3Mgd2lsbCBiZSBjaGFuZ2VkIGR1ZQp0byByZXNv
dXJjZSByZS1hbGxvY2F0aW9uLCBpbiBvcmRlciB0byBtYWtlIHN1cmUgdGhlIGd1ZXN0IGdtCmFk
ZHJlc3MgZG9lc24ndCBjaGFuZ2Ugd2l0aCB0aGF0IHRvIHJldHJpZXZlIHRoZSBndWVzdCBnbSBi
YXNlCmFkZHJlc3MgZnJvbSBQVklORk8uCgpTaWduZWQtb2ZmLWJ5OiBZdWxlaSBaaGFuZyA8eXVs
ZWkuemhhbmdAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0Bs
aW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NmZ19zcGFjZS5j
IHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICAgfCAgOCArKysr
LS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgIHwgMjIgKysrKysrKysr
KysrKysrKysrLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jZmdfc3BhY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jZmdfc3BhY2UuYwppbmRleCAxOWNmMWJiZTA1
OWQuLjI3MmY4ZGJhN2IyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Nm
Z19zcGFjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jZmdfc3BhY2UuYwpAQCAt
MzMsNiArMzMsNyBAQAogCiAjaW5jbHVkZSAiaTkxNV9kcnYuaCIKICNpbmNsdWRlICJndnQuaCIK
KyNpbmNsdWRlICJpOTE1X3B2aW5mby5oIgogCiBlbnVtIHsKIAlJTlRFTF9HVlRfUENJX0JBUl9H
VFRNTUlPID0gMCwKQEAgLTEzMyw3ICsxMzQsNyBAQCBzdGF0aWMgaW50IG1hcF9hcGVydHVyZShz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgYm9vbCBtYXApCiAJZWxzZQogCQl2YWwgPSAqKHUzMiAq
KSh2Z3B1X2NmZ19zcGFjZSh2Z3B1KSArIFBDSV9CQVNFX0FERFJFU1NfMik7CiAKLQlmaXJzdF9n
Zm4gPSAodmFsICsgdmdwdV9hcGVydHVyZV9vZmZzZXQodmdwdSkpID4+IFBBR0VfU0hJRlQ7CisJ
Zmlyc3RfZ2ZuID0gKHZhbCArIHZncHVfZ3Vlc3RfYXBlcnR1cmVfb2Zmc2V0KHZncHUpKSA+PiBQ
QUdFX1NISUZUOwogCiAJcmV0ID0gaW50ZWxfZ3Z0X2h5cGVydmlzb3JfbWFwX2dmbl90b19tZm4o
dmdwdSwgZmlyc3RfZ2ZuLAogCQkJCQkJICBhcGVydHVyZV9wYSA+PiBQQUdFX1NISUZULApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jCmluZGV4IDhhNWQyNmQxZDQwMi4uNzUzYWQ5NzVjOTU4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2d0dC5jCkBAIC03MCwxMCArNzAsMTAgQEAgaW50IGludGVsX2d2dF9nZ3R0X2dt
YWRyX2cyaChzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTY0IGdfYWRkciwgdTY0ICpoX2FkZHIp
CiAKIAlpZiAodmdwdV9nbWFkcl9pc19hcGVydHVyZSh2Z3B1LCBnX2FkZHIpKQogCQkqaF9hZGRy
ID0gdmdwdV9hcGVydHVyZV9nbWFkcl9iYXNlKHZncHUpCi0JCQkgICsgKGdfYWRkciAtIHZncHVf
YXBlcnR1cmVfb2Zmc2V0KHZncHUpKTsKKwkJCSAgKyAoZ19hZGRyIC0gdmdwdV9ndWVzdF9hcGVy
dHVyZV9nbWFkcl9iYXNlKHZncHUpKTsKIAllbHNlCiAJCSpoX2FkZHIgPSB2Z3B1X2hpZGRlbl9n
bWFkcl9iYXNlKHZncHUpCi0JCQkgICsgKGdfYWRkciAtIHZncHVfaGlkZGVuX29mZnNldCh2Z3B1
KSk7CisJCQkgICsgKGdfYWRkciAtIHZncHVfZ3Vlc3RfaGlkZGVuX2dtYWRyX2Jhc2UodmdwdSkp
OwogCXJldHVybiAwOwogfQogCkBAIC04NSwxMCArODUsMTAgQEAgaW50IGludGVsX2d2dF9nZ3R0
X2dtYWRyX2gyZyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTY0IGhfYWRkciwgdTY0ICpnX2Fk
ZHIpCiAJCXJldHVybiAtRUFDQ0VTOwogCiAJaWYgKGd2dF9nbWFkcl9pc19hcGVydHVyZSh2Z3B1
LT5ndnQsIGhfYWRkcikpCi0JCSpnX2FkZHIgPSB2Z3B1X2FwZXJ0dXJlX2dtYWRyX2Jhc2Uodmdw
dSkKKwkJKmdfYWRkciA9IHZncHVfZ3Vlc3RfYXBlcnR1cmVfZ21hZHJfYmFzZSh2Z3B1KQogCQkJ
KyAoaF9hZGRyIC0gZ3Z0X2FwZXJ0dXJlX2dtYWRyX2Jhc2UodmdwdS0+Z3Z0KSk7CiAJZWxzZQot
CQkqZ19hZGRyID0gdmdwdV9oaWRkZW5fZ21hZHJfYmFzZSh2Z3B1KQorCQkqZ19hZGRyID0gdmdw
dV9ndWVzdF9oaWRkZW5fZ21hZHJfYmFzZSh2Z3B1KQogCQkJKyAoaF9hZGRyIC0gZ3Z0X2hpZGRl
bl9nbWFkcl9iYXNlKHZncHUtPmd2dCkpOwogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2
dC5oCmluZGV4IDg2MjFkMGY1ZmQyNi4uMWY1ZWY1OWEzNmFjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2
dC5oCkBAIC00MjQsNiArNDI0LDIwIEBAIGludCBpbnRlbF9ndnRfbG9hZF9maXJtd2FyZShzdHJ1
Y3QgaW50ZWxfZ3Z0ICpndnQpOwogI2RlZmluZSB2Z3B1X2ZlbmNlX2Jhc2UodmdwdSkgKHZncHUt
PmZlbmNlLmJhc2UpCiAjZGVmaW5lIHZncHVfZmVuY2Vfc3oodmdwdSkgKHZncHUtPmZlbmNlLnNp
emUpCiAKKy8qIEFwZXJ0dXJlL0dNIHNwYWNlIGRlZmluaXRpb25zIGZvciB2R1BVIEd1ZXN0IHZp
ZXcgcG9pbnQgKi8KKyNkZWZpbmUgdmdwdV9ndWVzdF9hcGVydHVyZV9vZmZzZXQodmdwdSkgXAor
CXZncHVfdnJlZ190KHZncHUsIHZndGlmX3JlZyhhdmFpbF9ycy5tYXBwYWJsZV9nbWFkci5iYXNl
KSkKKyNkZWZpbmUgdmdwdV9ndWVzdF9oaWRkZW5fb2Zmc2V0KHZncHUpCVwKKwl2Z3B1X3ZyZWdf
dCh2Z3B1LCB2Z3RpZl9yZWcoYXZhaWxfcnMubm9ubWFwcGFibGVfZ21hZHIuYmFzZSkpCisKKyNk
ZWZpbmUgdmdwdV9ndWVzdF9hcGVydHVyZV9nbWFkcl9iYXNlKHZncHUpICh2Z3B1X2d1ZXN0X2Fw
ZXJ0dXJlX29mZnNldCh2Z3B1KSkKKyNkZWZpbmUgdmdwdV9ndWVzdF9hcGVydHVyZV9nbWFkcl9l
bmQodmdwdSkgXAorCSh2Z3B1X2d1ZXN0X2FwZXJ0dXJlX2dtYWRyX2Jhc2UodmdwdSkgKyB2Z3B1
X2FwZXJ0dXJlX3N6KHZncHUpIC0gMSkKKworI2RlZmluZSB2Z3B1X2d1ZXN0X2hpZGRlbl9nbWFk
cl9iYXNlKHZncHUpICh2Z3B1X2d1ZXN0X2hpZGRlbl9vZmZzZXQodmdwdSkpCisjZGVmaW5lIHZn
cHVfZ3Vlc3RfaGlkZGVuX2dtYWRyX2VuZCh2Z3B1KSBcCisJKHZncHVfZ3Vlc3RfaGlkZGVuX2dt
YWRyX2Jhc2UodmdwdSkgKyB2Z3B1X2hpZGRlbl9zeih2Z3B1KSAtIDEpCisKIHN0cnVjdCBpbnRl
bF92Z3B1X2NyZWF0aW9uX3BhcmFtcyB7CiAJX191NjQgaGFuZGxlOwogCV9fdTY0IGxvd19nbV9z
ejsgIC8qIGluIE1CICovCkBAIC00OTksMTIgKzUxMywxMiBAQCB2b2lkIGludGVsX2d2dF9kZWFj
dGl2YXRlX3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZncHUpOwogCiAvKiB2YWxpZGF0aW5nIEdN
IGZ1bmN0aW9ucyAqLwogI2RlZmluZSB2Z3B1X2dtYWRyX2lzX2FwZXJ0dXJlKHZncHUsIGdtYWRy
KSBcCi0JKChnbWFkciA+PSB2Z3B1X2FwZXJ0dXJlX2dtYWRyX2Jhc2UodmdwdSkpICYmIFwKLQkg
KGdtYWRyIDw9IHZncHVfYXBlcnR1cmVfZ21hZHJfZW5kKHZncHUpKSkKKwkoKGdtYWRyID49IHZn
cHVfZ3Vlc3RfYXBlcnR1cmVfZ21hZHJfYmFzZSh2Z3B1KSkgJiYgXAorCSAoZ21hZHIgPD0gdmdw
dV9ndWVzdF9hcGVydHVyZV9nbWFkcl9lbmQodmdwdSkpKQogCiAjZGVmaW5lIHZncHVfZ21hZHJf
aXNfaGlkZGVuKHZncHUsIGdtYWRyKSBcCi0JKChnbWFkciA+PSB2Z3B1X2hpZGRlbl9nbWFkcl9i
YXNlKHZncHUpKSAmJiBcCi0JIChnbWFkciA8PSB2Z3B1X2hpZGRlbl9nbWFkcl9lbmQodmdwdSkp
KQorCSgoZ21hZHIgPj0gdmdwdV9ndWVzdF9oaWRkZW5fZ21hZHJfYmFzZSh2Z3B1KSkgJiYgXAor
CSAoZ21hZHIgPD0gdmdwdV9ndWVzdF9oaWRkZW5fZ21hZHJfZW5kKHZncHUpKSkKIAogI2RlZmlu
ZSB2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIGdtYWRyKSBcCiAJICgodmdwdV9nbWFkcl9pc19h
cGVydHVyZSh2Z3B1LCBnbWFkcikgfHwgXAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdApp
bnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
