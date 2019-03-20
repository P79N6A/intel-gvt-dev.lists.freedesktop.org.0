Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp214029ywb;
        Tue, 19 Mar 2019 20:23:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygEVe/QMGOSzDcIAHwjllIR2Yu2s+NLSLC1Gc5a4Oca7/t1ZRCIGg2aR1gtlhPKWw1wRDs
X-Received: by 2002:a63:f84d:: with SMTP id v13mr5169998pgj.384.1553052222017;
        Tue, 19 Mar 2019 20:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052222; cv=none;
        d=google.com; s=arc-20160816;
        b=wgMikX/Umnq0QfofFQIWfOb8A+jOkiKMTolqlU8jQEInZalEvVqx0PRRhkgtMU2Q6C
         KCJ8711UxTzX25ZuXluRZoDb2S1/xQtg9CmmOFX+TmIJyC5bZket37VrPQ4Jiktt9FUq
         KdWd9jYf/3VxmMR6tjYR4PX52lR7pOHDgyeyI7eDvo5enRjya+3bZIn9hidjLaEG5hau
         Ki6N9fa1XwtUkh1Mh5O2rIHFRPZZ7dwlgSaizSra9DTHGdASUNXSJnbPWNg943wbxFuR
         8+zLc+MavvbQ5Kvt4bjSz4Fk9nGKsxJG0nEC3uALm9JM7mLKi4ri1BTClU1Rlp/UAlDS
         yQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=P/9Fxt49dQU8J7vjszhkN8VTzTzr4ZH4zHyKtU0ct7k=;
        b=ZeITbzeqLnUv3ILbkIf/DE05aX0rXumQwjzYcWZIzrbt7UKu30Eg4bfUCuMCyqybYU
         5qL/5Saj1FEyC31ddold0qpUCPH7+Le6txhFKt1d/2Fy97E9vF0LdizGjg43PBqU+GzR
         4VKNcKSswsdAVVpU8xGB6MNmE7Ly4bWj/NW56CVU6yn/EAKW/ZPFPU5+FQ51L9dSK/b9
         RNX08F0KuAoABoWKBTdfxtYKJfNwyQGARh0IY2YrNNQVeb6wu72pYSyLkVDnj/dLoDjm
         LGq2iF9Ottaa/49z8xHNUHNCK8fp+yD4PEbh3J0A7ur9vNKB3dOkGDEix5uCwwBtWvN5
         jgbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g1si746836plo.418.2019.03.19.20.23.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:23:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417989861;
	Wed, 20 Mar 2019 03:23:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE2489861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:23:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707681"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:23:39 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 4/6] drm/i915/gvt: Prevent use of uninitilized member
 fb_info->obj
Date: Wed, 20 Mar 2019 11:21:28 +0800
Message-Id: <20190320032130.9817-5-colin.xu@intel.com>
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

ZmJfaW5mbyBpcyBkdW1wZWQgZnJvbSB2Z3B1X2dldF9wbGFuZV9pbmZvKCkgYW5kIGNvcHkgdG8g
ZG1hYnVmX29iai0+aW5mbywKZmJfaW5mby0+b2JqIGlzIG5vdCB1c2VkIGFuZCAoZG1hYnVmX29i
ai0+aW5mbyktPm9iaiBpcyBhc3NpZ25lZCB0byBpdHNlbGYuClRvIGF2b2lkIHVzZSBvZiB1bmlu
aXRpYWxpemVkIG1lbWJlciwgemVybyBvdXQgZmJfaW5mbyBiZWZvcmUgdGhlIGR1bXAuCgpTaWdu
ZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kbWFidWYuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCmluZGV4IGYyN2VkZjE3YjRhYi4uNDlhNDI1
ZDUzM2Y0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCkBAIC0zNzcsNiArMzc3LDcgQEAg
aW50IGludGVsX3ZncHVfcXVlcnlfcGxhbmUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHZvaWQg
KmFyZ3MpCiAJCQkoIWdmeF9wbGFuZV9pbmZvLT5mbGFncykpCiAJCXJldHVybiAtRUlOVkFMOwog
CisJbWVtc2V0KCZmYl9pbmZvLCAwLCBzaXplb2YoZmJfaW5mbykpOwogCXJldCA9IHZncHVfZ2V0
X3BsYW5lX2luZm8oZGV2LCB2Z3B1LCAmZmJfaW5mbywKIAkJCQkJZ2Z4X3BsYW5lX2luZm8tPmRy
bV9wbGFuZV90eXBlKTsKIAlpZiAocmV0ICE9IDApCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBs
aXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
