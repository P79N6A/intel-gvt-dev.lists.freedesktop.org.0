Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4011468ywa;
        Tue, 19 Feb 2019 19:51:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYakfaREsrotrKzfSvyHoqJqxgCwypMJuuXvsBRke6z8WSveU24iA36W4lFXAUztpQag+lr
X-Received: by 2002:a65:6684:: with SMTP id b4mr27361119pgw.55.1550634692765;
        Tue, 19 Feb 2019 19:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550634692; cv=none;
        d=google.com; s=arc-20160816;
        b=E7ORt/fFDX01ZlBwpZjHcNWpNMODBRBFdB6wEya+OtSKHTB+HYSo0BUe8v0poHkmFr
         L28NMt05dV+yu01NROPHga3DpptsrIqi2wskNiMQCvn9azzVp+tC2sJRSsnw9xnijU5Z
         yt0te5shgxKFHV7ZQ7t1rPQyHI62MpjOZm+pl9Advkcn0LohoYsfbbTXl5TZYDZft16r
         vOh69XUnKGeOnq2VWbshB6hsOhkZvA+e2hwGN6jcD8mcqt/5kuZt3/hvvs1pK6CKfQte
         HvFL33QR+MkHHnrIBYev5H/z7r9A8EvG1IFbvtUH96vdPz/NlWHluV6s94R+KFym+jvs
         2h8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=lVcZjwwqAgDdvYeSqCcs7R6zAvjoQ+dQAwRmCt3YXE4=;
        b=w/pQq4dbSyTcj6vSx4C1Z2asPBpB5w/Jvfcy5x+2j3IaJbEkQ2gz/l5FobuqAvXxSo
         P2Jd08PrIZs5oR1hnmSDlVWcIqdX5YHDo3GpdLK6Ep8DKz2BfyAKRwdqM1hcH/gUpgT3
         TiBcRentq/QfkDofM74tbnTmiNFfVcw2BAeEykmnCXq//tz1WZldMJpk8auqzdJPdaKr
         jphSkvZUthmSxgPg7uXY3g2m6caP6f1muYYNOX0TwixkdesnJVAT7JY8KW+0D1O/lYoo
         MWRdzbTpjoT6yttC7ULs3+MOKQ3tZZiMyIN4ZrHPN5QdsX8GbhFhMbduKztnv0t8SkG5
         asoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id d9si18123287pls.412.2019.02.19.19.51.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 19:51:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51131890DD;
	Wed, 20 Feb 2019 03:51:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC725890DD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 03:51:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 19:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="145684607"
Received: from genxtest-ykzhao.sh.intel.com ([10.239.143.71])
 by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2019 19:51:30 -0800
From: Zhao Yakui <yakui.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gvt: Refine the combined intel_vgpu_oos_page
 struct to save memory
Date: Wed, 20 Feb 2019 12:07:45 +0800
Message-Id: <1550635665-30372-2-git-send-email-yakui.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550635665-30372-1-git-send-email-yakui.zhao@intel.com>
References: <1550635665-30372-1-git-send-email-yakui.zhao@intel.com>
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
Cc: Zhao Yakui <yakui.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGludGVsX3ZncHVfb29zX3BhZ2UgdXNlcyB0aGUgY29tYmluZWQgc3RydWN0dXJlLCB3aGlj
aCBlbWJlZHMgdGhlCnRyYWNrZWQgcGFnZS4gQXMgaXQgaXMgYWxsb2NhdGVkIGJ5IGttYWxsb2Ms
IHRoZSBzaXplKDQxNDApIGlzIGFsaWduZWQKdG8gODE5Mi4gVGhlIDgxOTIgb29zX3BhZ2VzIHdp
bGwgd2FzdGUgYWJvdXQgMzJNIG1lbW9yeS4KU28gdGhlIHRyYWNrZWQgcGFnZSBpcyBzcGxpdCBm
cm9tIHRoZSBpbnRlbF92Z3B1X29vc19wYWdlLiBBbmQgdGhpcyB3aWxsCmhlbHAgdG8gYXNzdXJl
IHRoYXQgdGhlIGFjY2VzcyBvZiB0cmFja2VkIHBhZ2UgaXMgY2FjaGUgYWxpZ25lZC4KCkFub3Ro
ZXIgbWlub3IgY2hhbmdlIGlzIHRoYXQgaXQgZG9lc24ndCBuZWVkIHRvIGJlIGNsZWFyZWQgdG8g
emVybyBhcwppdCBpcyB3cml0ZW4gZmlyc3RseSB3aGVuIG9uZSBwYWdlIGlzIGFkZGVkIHRvIG9v
c19wYWdlIGxpc3QuCgpTaWduZWQtb2ZmLWJ5OiBaaGFvIFlha3VpIDx5YWt1aS56aGFvQGludGVs
LmNvbT4KUmV2aWV3ZWQtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCA3ICsrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2d0dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IGM3MTAzZGQu
LjliYTFlZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTI0ODksNiArMjQ4OSw3IEBAIHN0
YXRpYyB2b2lkIGNsZWFuX3NwdF9vb3Moc3RydWN0IGludGVsX2d2dCAqZ3Z0KQogCWxpc3RfZm9y
X2VhY2hfc2FmZShwb3MsIG4sICZndHQtPm9vc19wYWdlX2ZyZWVfbGlzdF9oZWFkKSB7CiAJCW9v
c19wYWdlID0gY29udGFpbmVyX29mKHBvcywgc3RydWN0IGludGVsX3ZncHVfb29zX3BhZ2UsIGxp
c3QpOwogCQlsaXN0X2RlbCgmb29zX3BhZ2UtPmxpc3QpOworCQlmcmVlX3BhZ2UoKHVuc2lnbmVk
IGxvbmcpb29zX3BhZ2UtPm1lbSk7CiAJCWtmcmVlKG9vc19wYWdlKTsKIAl9CiB9CkBAIC0yNTA5
LDYgKzI1MTAsMTIgQEAgc3RhdGljIGludCBzZXR1cF9zcHRfb29zKHN0cnVjdCBpbnRlbF9ndnQg
Kmd2dCkKIAkJCXJldCA9IC1FTk9NRU07CiAJCQlnb3RvIGZhaWw7CiAJCX0KKwkJb29zX3BhZ2Ut
Pm1lbSA9ICh2b2lkICopX19nZXRfZnJlZV9wYWdlcyhHRlBfS0VSTkVMLCAwKTsKKwkJaWYgKCFv
b3NfcGFnZS0+bWVtKSB7CisJCQlyZXQgPSAtRU5PTUVNOworCQkJa2ZyZWUob29zX3BhZ2UpOwor
CQkJZ290byBmYWlsOworCQl9CiAKIAkJSU5JVF9MSVNUX0hFQUQoJm9vc19wYWdlLT5saXN0KTsK
IAkJSU5JVF9MSVNUX0hFQUQoJm9vc19wYWdlLT52bV9saXN0KTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
aAppbmRleCBkOGNiMDRjLi5lOWY3MmE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oCkBAIC0yMjEs
NyArMjIxLDcgQEAgc3RydWN0IGludGVsX3ZncHVfb29zX3BhZ2UgewogCXN0cnVjdCBsaXN0X2hl
YWQgbGlzdDsKIAlzdHJ1Y3QgbGlzdF9oZWFkIHZtX2xpc3Q7CiAJaW50IGlkOwotCXVuc2lnbmVk
IGNoYXIgbWVtW0k5MTVfR1RUX1BBR0VfU0laRV07CisJdm9pZCAqbWVtOwogfTsKIAogI2RlZmlu
ZSBHVFRfRU5UUllfTlVNX0lOX09ORV9QQUdFIDUxMgotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
