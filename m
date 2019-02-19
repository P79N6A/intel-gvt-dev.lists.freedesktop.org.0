Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3018862ywa;
        Mon, 18 Feb 2019 23:29:08 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYFk3MSMhujtABfR2fujt3VTMo3RmghDRElz3k9uHJ71BJS6bO3b66Cdz8lKNS2gFimhMiI
X-Received: by 2002:a17:902:82cc:: with SMTP id u12mr9613824plz.189.1550561348623;
        Mon, 18 Feb 2019 23:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550561348; cv=none;
        d=google.com; s=arc-20160816;
        b=MBuhAP+W0Z3lSSzhNDKcRJwalokX7szazOHyv97OzUMOwstFRyW0Y1lES2vLcfoKRe
         ORpNGykRsrsL4U1UmcPiu8l5y+TdzvTRwRvQAk0zdXqQqK8uqX9mufwGLrl2TirkJFr9
         2sYIuCTXePX6r+eWZZeE1dA8toFIvx7BMP65QMS+ombx0WcVpZcSxnllppvVbVmtCDpQ
         hoaFJv2AuMd6HI4EJV8aG93hH/XWsX3RxfXie0FNwtAwqy2Zym3ST61QKASksRYDDSZi
         AtzndCjNSeqcJiumEpFj3zRMTPz73iDSFKMtjZjbH6gwqr4DetNXsb1P3zPOGhYeYA5v
         i7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=Ol8XwL1Nd+oPdUnGqmkNzxL2Stz53im2HCmJtGmHBtk=;
        b=1KrHRE7l1yO+BeTN6Yo7VSeOLLxKkrCKwRuRecQSoeaOv0ZtnUttAsF86lQS4kWL2d
         Ra6dW+GGeVwseCgudqL9A8lsvhcYBy+IWkNelLIi0g6DiRBZjYgLhQBgk2ReAn1Ev68O
         +OpMz4/qPE7SfcQ8pxlnF/4jA2zEwqySJn56STSmrpCGIo+0bX55c4qbeCZ9pg2PMg78
         PM7Mh/EBBzr4w74pzVGBBdN9gRgU7/8B1zaSyAIXvsjx9flaRSIlj/KTcz53RwVz686/
         /4o7x2bq7IU/cENqYwP+gqODWgmhw8Hnm+cWK5WMAdb8Cf05KWjhPZ9XiLXJKhJCP6oi
         VoXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q15si14721554pgm.420.2019.02.18.23.29.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:29:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C09890DB;
	Tue, 19 Feb 2019 07:29:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A91890DB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:29:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="276083214"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2019 23:29:04 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 1/8] drm/i915/gvt: Apply g2h adjust for GTT mmio access
Date: Tue, 19 Feb 2019 02:23:41 -0500
Message-Id: <20190219072341.13596-1-yan.y.zhao@intel.com>
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

RnJvbTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGludGVsLmNvbT4KCkFwcGx5IGd1ZXN0IHRv
IGhvc3QgZ21hIGNvbnZlcnNpb24gd2hpbGUgZ3Vlc3QgdHJ5IHRvIGFjY2VzcyB0aGUKR1RUIG1t
aW8gcmVnaXN0ZXJzLCBhcyBhZnRlciBlbmFibGUgbGl2ZSBtaWdyYXRpb24gdGhlIGhvc3QgZ21h
CndpbGwgYmUgY2hhbmdlZCBkdWUgdG8gdGhlIHJlc291cmVjZSByZS1hbGxvY2F0aW9uLCBidXQg
Z3Vlc3QKZ21hIHNob3VsZCBiZSByZW1haW5pbmcgdW5jaGFuZ2VkLCB0aHVzIGcyaCBjb252ZXJz
aW9uIGlzIHJlcXVlc3QKZm9yIGl0LgoKU2lnbmVkLW9mZi1ieTogWXVsZWkgWmhhbmcgPHl1bGVp
LnpoYW5nQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGlu
dXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8IDE1ICsr
KysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKaW5kZXggYzcxMDNkZDJkOGQ1Li44YTVkMjZkMWQ0
MDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKQEAgLTY1LDggKzY1LDcgQEAgYm9vbCBpbnRlbF9n
dnRfZ2d0dF92YWxpZGF0ZV9yYW5nZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTY0IGFkZHIs
IHUzMiBzaXplKQogLyogdHJhbnNsYXRlIGEgZ3Vlc3QgZ21hZHIgdG8gaG9zdCBnbWFkciAqLwog
aW50IGludGVsX2d2dF9nZ3R0X2dtYWRyX2cyaChzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdTY0
IGdfYWRkciwgdTY0ICpoX2FkZHIpCiB7Ci0JaWYgKFdBUk4oIXZncHVfZ21hZHJfaXNfdmFsaWQo
dmdwdSwgZ19hZGRyKSwKLQkJICJpbnZhbGlkIGd1ZXN0IGdtYWRyICVsbHhcbiIsIGdfYWRkcikp
CisJaWYgKCF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIGdfYWRkcikpCiAJCXJldHVybiAtRUFD
Q0VTOwogCiAJaWYgKHZncHVfZ21hZHJfaXNfYXBlcnR1cmUodmdwdSwgZ19hZGRyKSkKQEAgLTIx
NjIsNyArMjE2MSw4IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9nZ3R0X21taW9fd3JpdGUoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYsCiAJc3RydWN0IGludGVsX3ZncHVf
bW0gKmdndHRfbW0gPSB2Z3B1LT5ndHQuZ2d0dF9tbTsKIAlzdHJ1Y3QgaW50ZWxfZ3Z0X2d0dF9w
dGVfb3BzICpvcHMgPSBndnQtPmd0dC5wdGVfb3BzOwogCXVuc2lnbmVkIGxvbmcgZ19ndHRfaW5k
ZXggPSBvZmYgPj4gaW5mby0+Z3R0X2VudHJ5X3NpemVfc2hpZnQ7Ci0JdW5zaWduZWQgbG9uZyBn
bWEsIGdmbjsKKwl1bnNpZ25lZCBsb25nIGdmbjsKKwl1bnNpZ25lZCBsb25nIGhfZ3R0X2luZGV4
OwogCXN0cnVjdCBpbnRlbF9ndnRfZ3R0X2VudHJ5IGUsIG07CiAJZG1hX2FkZHJfdCBkbWFfYWRk
cjsKIAlpbnQgcmV0OwpAQCAtMjE3MiwxMCArMjE3Miw4IEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9n
Z3R0X21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmYs
CiAJaWYgKGJ5dGVzICE9IDQgJiYgYnl0ZXMgIT0gOCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQln
bWEgPSBnX2d0dF9pbmRleCA8PCBJOTE1X0dUVF9QQUdFX1NISUZUOwotCiAJLyogdGhlIFZNIG1h
eSBjb25maWd1cmUgdGhlIHdob2xlIEdNIHNwYWNlIHdoZW4gYmFsbG9vbmluZyBpcyB1c2VkICov
Ci0JaWYgKCF2Z3B1X2dtYWRyX2lzX3ZhbGlkKHZncHUsIGdtYSkpCisJaWYgKGludGVsX2d2dF9n
Z3R0X2luZGV4X2cyaCh2Z3B1LCBnX2d0dF9pbmRleCwgJmhfZ3R0X2luZGV4KSkKIAkJcmV0dXJu
IDA7CiAKIAllLnR5cGUgPSBHVFRfVFlQRV9HR1RUX1BURTsKQEAgLTIyNTksMTEgKzIyNTcsMTIg
QEAgc3RhdGljIGludCBlbXVsYXRlX2dndHRfbW1pb193cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAq
dmdwdSwgdW5zaWduZWQgaW50IG9mZiwKIG91dDoKIAlnZ3R0X3NldF9ndWVzdF9lbnRyeShnZ3R0
X21tLCAmZSwgZ19ndHRfaW5kZXgpOwogCi0JZ2d0dF9nZXRfaG9zdF9lbnRyeShnZ3R0X21tLCAm
ZSwgZ19ndHRfaW5kZXgpOworCWdndHRfZ2V0X2hvc3RfZW50cnkoZ2d0dF9tbSwgJmUsIGhfZ3R0
X2luZGV4KTsKIAlnZ3R0X2ludmFsaWRhdGVfcHRlKHZncHUsICZlKTsKIAotCWdndHRfc2V0X2hv
c3RfZW50cnkoZ2d0dF9tbSwgJm0sIGdfZ3R0X2luZGV4KTsKKwlnZ3R0X3NldF9ob3N0X2VudHJ5
KGdndHRfbW0sICZtLCBoX2d0dF9pbmRleCk7CiAJZ2d0dF9pbnZhbGlkYXRlKGd2dC0+ZGV2X3By
aXYpOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
