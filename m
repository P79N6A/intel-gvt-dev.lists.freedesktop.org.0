Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp214329ywb;
        Tue, 19 Mar 2019 20:24:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5/1wlgTPpDogi6sjXuW7gu+fic+d4AmMw+mh9ZwOIdSRHVSF4J4+7E3Lq0kIvT0P6Nu26
X-Received: by 2002:a17:902:8a8a:: with SMTP id p10mr5487817plo.92.1553052252966;
        Tue, 19 Mar 2019 20:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052252; cv=none;
        d=google.com; s=arc-20160816;
        b=hhOCsKJFZxcVBz6txo8Hma/3bZ560jGlFatOMQxFwTsRorN3nCeFbXsL7Ap2znDO+X
         c2+lDJVSmjvAalhzvGtxj8xSMHSdBzSNhDoHV4fF+hgGCADEeW4WKrT8yniqcAzcPoxT
         uiO5aS6jE0rKIJ0Qb/14FPbTaxSKBGdVb2CJirYfUUKBYbJMwnjvA7e08YVFzInPLGDc
         MmrGShfbtD3wsTrrJ17siyJFlQnaBPPu7paFRgEd4ONGoJ5juokql1sJDC1RYqUJIarP
         y/yC8BOa+twviPGYhYln8mzDOWmXmVMUGel5pQwVe3cwaWp6s7bNmBYtKZMXnVrTT75R
         1f0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=8j5OHromhHybcmXV/AliJUJISE95UfkQ9RYYYNhKZcc=;
        b=Sj0fUpR9Dx7FnM2IH/NZ449gRtlG1/92QMjzSRu0vsZZ07p9IfLML1pn0+A9MfCy9J
         Me5ZjxvpWPIgug7tVAH/9LhqFVdPWAArsbLpcZpgst6cTQa81CxC5PHYxpP2D2Of9x1f
         McuJ19xevtL+EhVI32bLenYKdbmyJ43MY9PmtSHez0j/p4KYFmWPpIYm+msjkix38n5V
         FbM3Hh0qlTPbDRMp11XvPZoenSk4wsds8DxWM0KTAC/E+i7Gxrk2UMeO3kXMDhJKSX64
         nNpfYNiJGwEG1vywe822/34ssPnJ8aEMePtRIh1/wXlQ4AG/ghSKTMW/gTTqsaJHOcHv
         KbdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f17si601119pgm.210.2019.03.19.20.24.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:24:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C3689861;
	Wed, 20 Mar 2019 03:24:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC58389861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:24:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707747"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:24:10 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/gvt: Explicit cast int to u64 and prevent char
 buf overflow.
Date: Wed, 20 Mar 2019 11:21:29 +0800
Message-Id: <20190320032130.9817-6-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320032130.9817-1-colin.xu@intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
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

dmdwdS0+aWQgaXMgaW50IHdoaWxlIHZncHVfc2Nhbl9ub25wcml2YmJfc2V0KCkgb3V0cHV0IHZh
bCBpcyB1NjQuCkNhc3QgdG8gdTY0IGJlZm9yZSBiaXR3aXNlIG9wZXJhdGlvbi4KbmFtZVtdIGJ1
ZiBpbiBpbnRlbF9ndnRfZGVidWdmc19hZGRfdmdwdSBoYXMgbGVuZ3RoIDEwIGJ1dCB2Z3B1LT5p
ZAppcyBpbnQgc28gbmFtZSBidWYgY291bGQgb3ZlcmZsb3cgd2hlbiB2Z3B1LT5pZCBpcyBsYXJn
ZS4gQWx0aG91Z2gKY3VycmVudCBtYXggdmdwdS0+aWQgaXMgOCBidXQgc3RpbGwgaGFzIHBvdGVu
dGlhbCByaXNrIGluIGZ1dHVyZS4KClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54dUBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyB8IDYgKysr
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jCmluZGV4IDJlYzg5YmNiNTlmMS4uNjczYWEwMGY4NTY5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMKQEAgLTE0Nyw3ICsxNDcsNyBAQCB2Z3B1
X3NjYW5fbm9ucHJpdmJiX3NldCh2b2lkICpkYXRhLCB1NjQgdmFsKQogCWNoYXIgYnVmWzEyOF0s
ICpzOwogCWludCBsZW47CiAKLQl2YWwgJj0gKDEgPDwgSTkxNV9OVU1fRU5HSU5FUykgLSAxOwor
CXZhbCAmPSAodTY0KSgxIDw8IEk5MTVfTlVNX0VOR0lORVMpIC0gMTsKIAogCWlmICh2Z3B1LT5z
Y2FuX25vbnByaXZiYiA9PSB2YWwpCiAJCXJldHVybiAwOwpAQCAtMTY5LDcgKzE2OSw3IEBAIHZn
cHVfc2Nhbl9ub25wcml2YmJfc2V0KHZvaWQgKmRhdGEsIHU2NCB2YWwpCiAJCQlsZW4gPSBzbnBy
aW50ZihzLCA0LCAiJWQsICIsIGVuZ2luZS0+aWQpOwogCQkJcyArPSBsZW47CiAJCX0gZWxzZQot
CQkJdmFsICY9ICB+KDEgPDwgaWQpOworCQkJdmFsICY9ICB+KHU2NCkoMSA8PCBpZCk7CiAJfQog
CiAJaWYgKHZhbCkKQEAgLTE5Niw3ICsxOTYsNyBAQCBERUZJTkVfU0lNUExFX0FUVFJJQlVURSh2
Z3B1X3NjYW5fbm9ucHJpdmJiX2ZvcHMsCiBpbnQgaW50ZWxfZ3Z0X2RlYnVnZnNfYWRkX3ZncHUo
c3RydWN0IGludGVsX3ZncHUgKnZncHUpCiB7CiAJc3RydWN0IGRlbnRyeSAqZW50OwotCWNoYXIg
bmFtZVsxMF0gPSAiIjsKKwljaGFyIG5hbWVbMTZdID0gIiI7CiAKIAlzcHJpbnRmKG5hbWUsICJ2
Z3B1JWQiLCB2Z3B1LT5pZCk7CiAJdmdwdS0+ZGVidWdmcyA9IGRlYnVnZnNfY3JlYXRlX2Rpcihu
YW1lLCB2Z3B1LT5ndnQtPmRlYnVnZnNfcm9vdCk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
