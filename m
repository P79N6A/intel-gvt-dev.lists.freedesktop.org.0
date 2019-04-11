Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6746268ywo;
        Thu, 11 Apr 2019 03:47:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx++aiKjKILKnm/QktkLHfIUO34+Diy1EKBGLG257Y2VN7GiGUR/ClN+xGkOz55ncnT8zP3
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr2336997plv.90.1554979649157;
        Thu, 11 Apr 2019 03:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554979649; cv=none;
        d=google.com; s=arc-20160816;
        b=TrSgvh6GK2FB/YwKU/Z9YKkalF2/vN2lNIEUiaTXlNFlc3RV/MQRK891KeZrna8JHx
         SMbIM54c/Yg17ylMOqkpPj3b90nK1ydWmPwsDuGRxjOwq/plbUjfKDlKRSMB4abXu4lT
         XRZv9mHoFPE4/nygoQxCP1AsEWGW9P2I49/CoP+FEdxVOWDHPqpXlLIFeK10YS3VEEOH
         Yeiv4B678+cVVqevxwuQRYf/ijaoGmDlX0Ydu+myJvbGMuHzBIIVZHBJXkjAPMKUcyFA
         Ioew2OyeIwPJWIqJkrYbO7CUf3rNlls5M99OnmBGmGVCFIwPd0dSirGFIX5mSns0UJmT
         WC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=gkqjf/q7CdEFh6+lG1mwrTOaSWtk7XDnAYupKbk95R8=;
        b=T4lXgQNZLjlmcA0T2ApmJpPjZPkXi+iYVgpLpYyHPOlkZOBA7CVY9S2c2Y04feHjRj
         X2EloWxwjgR60G0Wxhe3EsfDcFBoMlH93yt/xza/zzPTtxneUErdA+JfBmgnqVL7O/z/
         rNLhsPGacmkyuWXxmj2FqEHmFTYKG9aFc1JdR9Y4PUNtmr0CJ2/aXpeMYnGBsve9iXtQ
         2pwJ6SvBWBAVBH9TWxZLO+EvdyFCoocQwiYdM2dfd+UulF8aJzUlnJyhhiwhktOg6CBZ
         BrZruG/Qa2LsUBADtks2++TPlbmSza3+qv8aO9ZKDlvu97MprdIYmbV3T7PMHzFdK+4n
         aLvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d22si33686708pls.435.2019.04.11.03.47.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 03:47:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED5F894E0;
	Thu, 11 Apr 2019 10:47:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FD8892CC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 10:47:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 03:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="160715267"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2019 03:47:25 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2 2/6] drm/i915/gvt: Do not copy the uninitialized pointer
 from fb_info
Date: Thu, 11 Apr 2019 13:46:27 +0300
Message-Id: <20190411104631.7627-3-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
References: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Colin Xu <colin.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW4gdGhlIGNvZGUgdGhlIG1lbWNweSgpIGZ1bmN0aW9uIGNvcGllZCB1bmluaXRpYWxpemVkIHBv
aW50ZXIgaW4gZmJfaW5mbwp0byBkbWFidWZfb2JqLT5pbmZvLiBMYXRlciB0aGUgcG9pbnRlciBp
biBkbWFidWZfb2JqLT5pbmZvIHdpbGwgYmUKaW5pdGlhbGl6ZWQuIFRvIG1ha2UgdGhlIGNvZGUg
YWxpZ25lZCB3aXRoIHJlcXVpcmVtZW50cyBvZiB0aGUga2xvY3dvcmsKc3RhdGljIGNvZGUgYW5h
bHl6ZXIsIHRoZSB1bmluaXRpYWxpemVkIHBvaW50ZXIgc2hvdWxkIGJlIGluaXRpYWxpemVkCmJl
Zm9yZSBtZW1jcHkoKS4KCnYyOgotIEluaXRpYWxpemUgZmJfaW5mby5vYmogaW4gdmdwdV9nZXRf
cGxhbmVfaW5mbygpLiAoQ29saW4gWHUpCgpUaGlzIHBhdGNoIGZpeGVkIHRoZSBjcml0aWNhbCBp
c3N1ZSAjNjMyIHJlcG9ydGVkIGJ5IGtsb2Nrd29yay4KClNpZ25lZC1vZmYtYnk6IEFsZWtzZWkg
R2ltYml0c2tpaSA8YWxla3NlaS5naW1iaXRza2lpQGludGVsLmNvbT4KQ2M6IFpoZW55dSBXYW5n
IDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KQ2M6IFpoaSBXYW5nIDx6aGkuYS53YW5nQGludGVs
LmNvbT4KQ2M6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwppbmRleCBmNmJlOTcxMTk5NjguLjgyZWIz
OWMwOWEyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwpAQCAtMjExLDYgKzIxMSw4IEBA
IHN0YXRpYyBpbnQgdmdwdV9nZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CXN0cnVjdCBpbnRlbF92Z3B1X2N1cnNvcl9wbGFuZV9mb3JtYXQgYzsKIAlpbnQgcmV0OwogCisJ
bWVtc2V0KGluZm8sIDAsIHNpemVvZigqaW5mbykpOworCiAJaWYgKHBsYW5lX2lkID09IERSTV9Q
TEFORV9UWVBFX1BSSU1BUlkpIHsKIAkJcmV0ID0gaW50ZWxfdmdwdV9kZWNvZGVfcHJpbWFyeV9w
bGFuZSh2Z3B1LCAmcCk7CiAJCWlmIChyZXQpCi0tIAoyLjE3LjEKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbnRl
bCBGaW5sYW5kIE95ClJlZ2lzdGVyZWQgQWRkcmVzczogUEwgMjgxLCAwMDE4MSBIZWxzaW5raSAK
QnVzaW5lc3MgSWRlbnRpdHkgQ29kZTogMDM1NzYwNiAtIDQgCkRvbWljaWxlZCBpbiBIZWxzaW5r
aSAKClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29uZmlkZW50
aWFsIG1hdGVyaWFsIGZvcgp0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChz
KS4gQW55IHJldmlldyBvciBkaXN0cmlidXRpb24KYnkgb3RoZXJzIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZApyZWNpcGllbnQsIHBsZWFzZSBjb250
YWN0IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QK
aW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
