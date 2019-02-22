Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1072068ywe;
        Thu, 21 Feb 2019 22:14:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaKvgwTUnSk9Y12hwXaZTR/3obBPfWFlhysNwv04JgNzQ6VZrfV2p2PMk23qZKU4fPrwoSD
X-Received: by 2002:a62:1c86:: with SMTP id c128mr2681216pfc.54.1550816054568;
        Thu, 21 Feb 2019 22:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550816054; cv=none;
        d=google.com; s=arc-20160816;
        b=03CxD6Nj6RlWRIH97ynKMK6qF/fh4vaUFmKNCK7iPT36cfsVeRTYiUJRH+guW0wG0y
         Dr482/XL6CQy355U+UGz5WexMUyfOgTLNDwU9Upz61/DWbnXH3CTdCw0pWl3G7/khIag
         QhNJOa+oLDKARDOyAzb/ltAKU+eKY+HD28bhZwMzs0vVozLD40LRWCgyttF4RQnty1zN
         +XiSMduScZAZVkWLHdGcAT/z8jE1MVt2aPNhB9mtkvGhhIT3r27j/fsPYi9JEoxGwB0P
         PiF4AYx9hOfURR8+XKK+8A2IhXdtE4/MOvIW/Mzi4HkMi3BYvwIABdDo3SyPWmkQmtjU
         NjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=8FfyIcNlE9KWnGf7v8wxxbHy5G5U2fti/MybG0MZijY=;
        b=RLs2pCW3njGfuVZPx7q5P3x6UVXOdtJ8rDh5Pz9109gqRF0oHcAOuYo3rFuiNZu+lD
         IsHny012162h0WCiFF2KWYNoL8PEqtrvz/rIEO5qah4bHu7MosdfpQbn/CdxLEeiPfYj
         uk37eavd9BbnuTSSvg8WiGKkr+n9vWe3IfjGKupLBB5nudITnnsuphEzrPeWNwobbamO
         Jtr5Si3IlPRKoptzAtbQvbMf2bcjtybvXtO9Khhf/uHR7SBJVvyQS61TRKnxZgKt3NCQ
         r2OBvucV+jxb2htinfeEGwA+uDoV2hZNXBArOBushOeTEp2YVGRD3MvDuUX1xjm3Viua
         9RwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id u7si576260plz.379.2019.02.21.22.14.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 22:14:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CC3892D4;
	Fri, 22 Feb 2019 06:14:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA02892D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 06:14:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2019 22:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,398,1544515200"; d="scan'208";a="301672161"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.22])
 by orsmga005.jf.intel.com with ESMTP; 21 Feb 2019 22:14:10 -0800
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio list
Date: Fri, 22 Feb 2019 14:13:42 +0800
Message-Id: <20190222061342.21578-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.20.1
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

RGVwZW5kcyBvbiBHRU4gZmFtaWx5IGFuZCBJOTE1X1BBUkFNX0hBU19DT05URVhUX0lTT0xBVElP
TiwgTWVzYSBkcml2ZXIKd2lsbCBkZWNpZGUgd2hldGhlciBjb25zdGFudCBidWZmZXIgMCBhZGRy
ZXNzIGlzIHJlbGF0aXZlIG9yIGFic29sdXRlLAphbmQgbG9hZCBHUFUgaW5pdGlhbCBzdGF0ZSBi
eSBscmkgdG8gY29udGV4dCBtbWlvIElOU1RQTSAoR0VOOCkKb3IgMHgyMEQ4ICg+PUdFTjkpLgpN
ZXNhIENvbW1pdCBmYThhNzY0YjYyCigiaTk2NTogVXNlIGFic29sdXRlIGFkZHJlc3NpbmcgZm9y
IGNvbnN0YW50IGJ1ZmZlciAwIG9uIEtlcm5lbCA0LjE2Ky4iKQoKSU5TVFBNIGlzIGFscmVhZHkg
YWRkZWQgdG8gZ2VuOF9lbmdpbmVfbW1pb19saXN0LCBidXQgMHgyMEQ4IGlzIG1pc3NlZAppbiBn
ZW45X2VuZ2luZV9tbWlvX2xpc3QuIEZyb20gR1ZUIHBvaW50IG9mIHZpZXcsIGRpZmZlcmVudCBn
dWVzdCBjb3VsZApoYXZlIGRpZmZlcmVudCBjb250ZXh0IHNvIHNob3VsZCBzd2l0Y2ggdGhvc2Ug
bW1pbyBhY2NvcmRpbmdseS4KCkZpeGVzOiAxNzg2NTcxMzkzMDcgKCJkcm0vaTkxNS9ndnQ6IHZH
UFUgY29udGV4dCBzd2l0Y2giKQoKdjI6IFVwZGF0ZSBmaXhlcyBjb21taXQgSUQuCgpTaWduZWQt
b2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jCmluZGV4IDdkODRj
ZmI5MDUxYS4uNzkwMmZiMTYyZDA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvbW1pb19jb250ZXh0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29u
dGV4dC5jCkBAIC0xMzIsNiArMTMyLDcgQEAgc3RhdGljIHN0cnVjdCBlbmdpbmVfbW1pbyBnZW45
X2VuZ2luZV9tbWlvX2xpc3RbXSBfX2NhY2hlbGluZV9hbGlnbmVkID0gewogCiAJe1JDUywgR0VO
OV9HQU1UX0VDT19SRUdfUldfSUEsIDB4MCwgZmFsc2V9LCAvKiAweDRhYjAgKi8KIAl7UkNTLCBH
RU45X0NTRkVfQ0hJQ0tFTjFfUkNTLCAweGZmZmYsIGZhbHNlfSwgLyogMHgyMGQ0ICovCisJe1JD
UywgX01NSU8oMHgyMEQ4KSwgMHhmZmZmLCB0cnVlfSwgLyogMHgyMGQ4ICovCiAKIAl7UkNTLCBH
RU44X0dBUkJDTlRMLCAweDAsIGZhbHNlfSwgLyogMHhiMDA0ICovCiAJe1JDUywgR0VON19GRl9U
SFJFQURfTU9ERSwgMHgwLCBmYWxzZX0sIC8qIDB4MjBhMCAqLwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
