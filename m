Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp347745ywb;
        Tue, 19 Mar 2019 23:46:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmFlUFgfioMbto/7FYKsJInIkv+8d2Em1flqt73xY41lV6nnF6PsIW4ku5VuyBWOtvrFzS
X-Received: by 2002:a65:47cb:: with SMTP id f11mr5999933pgs.18.1553064363693;
        Tue, 19 Mar 2019 23:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553064363; cv=none;
        d=google.com; s=arc-20160816;
        b=Fu2xKfO2i9iCOXXtcPbsZeqYOw4QsvWkUJP5Et4EgNsLefn3xQe4H7APsDviWDKhQK
         Zmwu7yJ4daj3TYhIXF2VYnn0XdKQ44z/ju44piIvrMpsw0p6u7U+bEVUvyAnJtURDUu8
         58EzK4v26Xs2t5Ek3nJAIRp1fBj8vZq6+4AV89UZoe+2XWW9jlZlHjtspBrz9yPtmHdu
         zC78jyeruGwaartRGz3iQrolS4KB5JRJehlHZW5BOUQzBvL9TM4BI83rfHO9Mw4E7n+l
         MycyUt83ceLDvllYfNZFrk9x/EGNgplPresG3XWSLKiROqYCVGO84GbSwEbYDZQl0wll
         m/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=epQH8MKtID55VGdNplsCXswkKVNol/ricir257aYl6M=;
        b=M7XXESywoQBnr/xqfIOcyw6YD4wQCxbxXH4sQrhZtH45UT8K5JEShPUf1akDT0DtCs
         XkjQ7M53wdvB2vp++oE29pFDYHKtVQU75z4RTQtdHBzHcMWKfHC7cfyTnEUc3VDSxWmw
         tKh3ApMcQBtX5DVIQCU6QWOZ/bKkBDPdSXpSgBmq/nTHrvdnybtA/cpuHWsgDHRqjVPi
         HH7V/aPGdB6GbInk+fVWEI0Bh3F+8zCCEJeXmdl1GAaPqAdvTGP07C1ncSxaNFX1QCMf
         MQfypZFaGz3a8NF/nBBsg1GZYbd/7EmV8upYU5iYhvkHkL7Ur5tcVfsZiLzoJ86RQITU
         brsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id x19si973158pfa.130.2019.03.19.23.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 23:46:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467B889B27;
	Wed, 20 Mar 2019 06:46:03 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5766089B27
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 06:46:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 23:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,248,1549958400"; d="scan'208";a="135787301"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2019 23:45:59 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/gvt: Add macro define for mmio 0x50080 and gvt
 flip event
Date: Wed, 20 Mar 2019 14:45:19 +0800
Message-Id: <20190320064521.31145-2-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320064521.31145-1-colin.xu@intel.com>
References: <20190320064521.31145-1-colin.xu@intel.com>
MIME-Version: 1.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

QWRkIFNLTF9GTElQX0VWRU5UIHRvIGFkZHJlc3MgaW50byBpbnRlbF9ndnRfZXZlbnRfdHlwZSBm
b3IgcHJpbWFyeQphbmQgc3ByaXRlMCBwbGFuZSBmbGlwIGV2ZW50LgpBZGQgbWFjcm8gdG8gYWRk
cmVzcyBSRUdfNTAwODAgb2Zmc2V0LgoKU2lnbmVkLW9mZi1ieTogQ29saW4gWHUgPGNvbGluLnh1
QGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcmVnLmggfCAyNyArKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3JlZy5oIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3JlZy5oCmluZGV4IDU2Y2ZmMjBlYmE0NC4uNTBkM2U3OGI4ZGVkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvcmVnLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L3JlZy5oCkBAIC02MCw2ICs2MCwzMyBAQAogI2RlZmluZSBfUkVHXzcw
MUMwKHBpcGUsIHBsYW5lKSAoMHg3MDFjMCArIHBpcGUgKiAweDEwMDAgKyAocGxhbmUgLSAxKSAq
IDB4MTAwKQogI2RlZmluZSBfUkVHXzcwMUM0KHBpcGUsIHBsYW5lKSAoMHg3MDFjNCArIHBpcGUg
KiAweDEwMDAgKyAocGxhbmUgLSAxKSAqIDB4MTAwKQogCisjZGVmaW5lIFNLTF9GTElQX0VWRU5U
KHBpcGUsIHBsYW5lKSAoUFJJTUFSWV9BX0ZMSVBfRE9ORSArIChwbGFuZSkgKiAzICsgKHBpcGUp
KQorCisjZGVmaW5lIFJFR181MDA4MChfcGlwZSwgX3BsYW5lKSAoeyBcCisJdHlwZW9mKF9waXBl
KSAocCkgPSAoX3BpcGUpOyBcCisJdHlwZW9mKF9wbGFuZSkgKHEpID0gKF9wbGFuZSk7IFwKKwko
KChwKSA9PSBQSVBFX0EpID8gKCgocSkgPT0gUExBTkVfUFJJTUFSWSkgPyAoX01NSU8oMHg1MDA4
MCkpIDogXAorCQkoX01NSU8oMHg1MDA5MCkpKSA6IFwKKwkoKChwKSA9PSBQSVBFX0IpID8gKCgo
cSkgPT0gUExBTkVfUFJJTUFSWSkgPyAoX01NSU8oMHg1MDA4OCkpIDogXAorCQkoX01NSU8oMHg1
MDA5OCkpKSA6IFwKKwkoKChwKSA9PSBQSVBFX0MpID8gKCgocSkgPT0gUExBTkVfUFJJTUFSWSkg
PyAoX01NSU8oMHg1MDA4QykpIDogXAorCQkoX01NSU8oMHg1MDA5QykpKSA6IFwKKwkJKF9NTUlP
KDB4NTAwODApKSkpKTsgfSkKKworI2RlZmluZSBSRUdfNTAwODBfVE9fUElQRShfcmVnKSAoeyBc
CisJdHlwZW9mKF9yZWcpIChyZWcpID0gKF9yZWcpOyBcCisJKCgocmVnKSA9PSAweDUwMDgwIHx8
IChyZWcpID09IDB4NTAwOTApID8gKFBJUEVfQSkgOiBcCisJKCgocmVnKSA9PSAweDUwMDg4IHx8
IChyZWcpID09IDB4NTAwOTgpID8gKFBJUEVfQikgOiBcCisJKCgocmVnKSA9PSAweDUwMDhDIHx8
IChyZWcpID09IDB4NTAwOUMpID8gKFBJUEVfQykgOiBcCisJKElOVkFMSURfUElQRSkpKSk7IH0p
CisKKyNkZWZpbmUgUkVHXzUwMDgwX1RPX1BMQU5FKF9yZWcpICh7IFwKKwl0eXBlb2YoX3JlZykg
KHJlZykgPSAoX3JlZyk7IFwKKwkoKChyZWcpID09IDB4NTAwODAgfHwgKHJlZykgPT0gMHg1MDA4
OCB8fCAocmVnKSA9PSAweDUwMDhDKSA/IFwKKwkJKFBMQU5FX1BSSU1BUlkpIDogXAorCSgoKHJl
ZykgPT0gMHg1MDA5MCB8fCAocmVnKSA9PSAweDUwMDk4IHx8IChyZWcpID09IDB4NTAwOUMpID8g
XAorCQkoUExBTkVfU1BSSVRFMCkgOiAoSTkxNV9NQVhfUExBTkVTKSkpOyB9KQorCiAjZGVmaW5l
IEdGWF9NT0RFX0JJVF9TRVRfSU5fTUFTSyh2YWwsIGJpdCkgXAogCQkoKCgoYml0KSAmIDB4ZmZm
ZjAwMDApID09IDApICYmICEhKCh2YWwpICYgKCgoYml0KSA8PCAxNikpKSkKIAotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
