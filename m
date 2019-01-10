Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1662107ywd;
        Thu, 10 Jan 2019 03:12:10 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6GNgsucUxoCOM8e3pxZjWFXuSRTxEbsPaQDAShPcxfFQp5zsDNxjlH7xxGeIGXk4qPp5GP
X-Received: by 2002:a63:5f89:: with SMTP id t131mr9162499pgb.26.1547118730444;
        Thu, 10 Jan 2019 03:12:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547118730; cv=none;
        d=google.com; s=arc-20160816;
        b=01An1mPkUx1+BSoo60FmRQN+UajwnITvMzVm3VRt4TmV0TcEiY2nLbwKkbbeReyHrz
         fnjlDpDwkGkdRk+XbhShtE90UicIHxtdLCqUKxKKmAcZ39pl2LZVsyicqpDdxuk3L3Zv
         VKMGhmA/F/s9LdWuCprAc5s8XzQ9iCMVSQ5s27LcIt5QBgddxn/m2RoqvxjdI6VbLRPl
         LFOTgCfypN8EHJdZep9UyX5PvGxPF9BJR1Rh8kL5EsgDC6QmB5ZkthWBjmohWw8UksOa
         0d/qKHSysQgZqyHXYnrIs/fk3xnS726QumVUM4RPeaI3rbrDa9B+ZC4hJ/StAH05YaBZ
         q89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=nsKZO+tvpDcHReXmTM7sGE84qJklwF7VsC3dPjKMGlc=;
        b=g8yNUY10JEQ85VfL0wjWvqC84xXw8vovxksbm6HB53mFOI4Wt6S88NyDCe1kIKhhVt
         L+Jb8ICRs2CK4CuPMuwSSMulSsR5VizaUjkm49Zyo8ng1FLfItuS3+P/UKKaDNmXw1Rc
         +sQMw7+1kt+3JPUNZeKhxRFO8Sja2d3ToBC0fguJAVF9KZrVK1q1d4Yvi+hG/b3XlCkQ
         2jtsdO8XQFd81ZFteNMtO8QDEJmUkCzcCJB/rCeYGJ/DvKtS+lktsYPn4WMfRm/MuVrE
         U1O+mkVBUGcPwqOwDQDJcDo4WB66VRwP7qvjWOMulFQ4Lpihn2kUj7FN25nRLhoNpnFQ
         e4ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 69si18575557pla.75.2019.01.10.03.12.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 03:12:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC6C6F2A9;
	Thu, 10 Jan 2019 11:12:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A371C6F2A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Jan 2019 11:12:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 03:12:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,461,1539673200"; d="scan'208";a="290468343"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2019 03:12:06 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v1 2/4] drm/i915/gvt: add functions to get resolution from id
Date: Thu, 10 Jan 2019 19:04:46 +0800
Message-Id: <1547118288-1001-3-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKVGhlIGZ1bmN0aW9u
cyB3aWxsIGhlbHAgdG8gZ2V0IHJlc29sdXRpb24gZnJvbSBkZWZhdWx0IHZncHUgdHlwZS4KClNp
Z25lZC1vZmYtYnk6IEhhbmcgWXVhbiA8aGFuZy55dWFuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jIHwgIDEgKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2Rpc3BsYXkuaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYwppbmRleCA0ZjI1YjZiLi42YTg2ZmFjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMKQEAgLTM0Miw2ICszNDIsNyBAQCBzdGF0aWMgaW50
IHNldHVwX3ZpcnR1YWxfZHBfbW9uaXRvcihzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgaW50IHBv
cnRfbnVtLAogCXBvcnQtPmRwY2QtPmRhdGFfdmFsaWQgPSB0cnVlOwogCXBvcnQtPmRwY2QtPmRh
dGFbRFBDRF9TSU5LX0NPVU5UXSA9IDB4MTsKIAlwb3J0LT50eXBlID0gdHlwZTsKKwlwb3J0LT5p
ZCA9IHJlc29sdXRpb247CiAKIAllbXVsYXRlX21vbml0b3Jfc3RhdHVzX2NoYW5nZSh2Z3B1KTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuaCBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmgKaW5kZXggZWE3YzFjNS4uYTg3ZjMzZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5oCkBAIC0xNDYsMTggKzE0NiwxOSBAQCBlbnVtIGlu
dGVsX3ZncHVfcG9ydF90eXBlIHsKIAlHVlRfUE9SVF9NQVgKIH07CiAKK2VudW0gaW50ZWxfdmdw
dV9lZGlkIHsKKwlHVlRfRURJRF8xMDI0Xzc2OCwKKwlHVlRfRURJRF8xOTIwXzEyMDAsCisJR1ZU
X0VESURfTlVNLAorfTsKKwogc3RydWN0IGludGVsX3ZncHVfcG9ydCB7CiAJLyogcGVyIGRpc3Bs
YXkgRURJRCBpbmZvcm1hdGlvbiAqLwogCXN0cnVjdCBpbnRlbF92Z3B1X2VkaWRfZGF0YSAqZWRp
ZDsKIAkvKiBwZXIgZGlzcGxheSBEUENEIGluZm9ybWF0aW9uICovCiAJc3RydWN0IGludGVsX3Zn
cHVfZHBjZF9kYXRhICpkcGNkOwogCWludCB0eXBlOwotfTsKLQotZW51bSBpbnRlbF92Z3B1X2Vk
aWQgewotCUdWVF9FRElEXzEwMjRfNzY4LAotCUdWVF9FRElEXzE5MjBfMTIwMCwKLQlHVlRfRURJ
RF9OVU0sCisJZW51bSBpbnRlbF92Z3B1X2VkaWQgaWQ7CiB9OwogCiBzdGF0aWMgaW5saW5lIGNo
YXIgKnZncHVfZWRpZF9zdHIoZW51bSBpbnRlbF92Z3B1X2VkaWQgaWQpCkBAIC0xNzIsNiArMTcz
LDMwIEBAIHN0YXRpYyBpbmxpbmUgY2hhciAqdmdwdV9lZGlkX3N0cihlbnVtIGludGVsX3ZncHVf
ZWRpZCBpZCkKIAl9CiB9CiAKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHZncHVfZWRpZF94
cmVzKGVudW0gaW50ZWxfdmdwdV9lZGlkIGlkKQoreworCXN3aXRjaCAoaWQpIHsKKwljYXNlIEdW
VF9FRElEXzEwMjRfNzY4OgorCQlyZXR1cm4gMTAyNDsKKwljYXNlIEdWVF9FRElEXzE5MjBfMTIw
MDoKKwkJcmV0dXJuIDE5MjA7CisJZGVmYXVsdDoKKwkJcmV0dXJuIDA7CisJfQorfQorCitzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGludCB2Z3B1X2VkaWRfeXJlcyhlbnVtIGludGVsX3ZncHVfZWRp
ZCBpZCkKK3sKKwlzd2l0Y2ggKGlkKSB7CisJY2FzZSBHVlRfRURJRF8xMDI0Xzc2ODoKKwkJcmV0
dXJuIDc2ODsKKwljYXNlIEdWVF9FRElEXzE5MjBfMTIwMDoKKwkJcmV0dXJuIDEyMDA7CisJZGVm
YXVsdDoKKwkJcmV0dXJuIDA7CisJfQorfQorCiB2b2lkIGludGVsX2d2dF9lbXVsYXRlX3ZibGFu
ayhzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpOwogdm9pZCBpbnRlbF9ndnRfY2hlY2tfdmJsYW5rX2Vt
dWxhdGlvbihzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpOwogCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
