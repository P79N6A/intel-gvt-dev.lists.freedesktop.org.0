Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp6746225ywo;
        Thu, 11 Apr 2019 03:47:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLIi+VoB8nRlS4iOLdPJZDfSAwg6f7QThKUwnkkHUKvMVfULUOiDRhzDldxZ/rhYmRQy3S
X-Received: by 2002:a65:6108:: with SMTP id z8mr46329312pgu.106.1554979646430;
        Thu, 11 Apr 2019 03:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554979646; cv=none;
        d=google.com; s=arc-20160816;
        b=hjnj9lzcsVZoaWHC+L00lHI23BcZLYHYaqQ0Ku6TmaZjGr5VLLtD4116FHjkBKlUFq
         gstikUxVQ+IHXSNql6+7svyDAIOOW3MtsdSvx6Nln4ahebh4Jo6MsR9Z1TRh6pjkKfxt
         VLMOVvew2xG3cyaAluDIV5bnk+T5cFuB8EIuQmcdpvxCbUlJHktTjSkoLsXoWQUEnnoc
         mz+P8BxJa9fpzaw2m62rYkzRJcr5oyoq8WcbF6tV60Mkb0hrAujmByZMZdPGk0osd2Rg
         mIgcPcmCZ+k4ZWtnrMdHI7gwYobu7gy77/xY5HThT+V3R5nl6+pW04oopLSH4pSwws1y
         1QUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=xEVg6zuMGSsz5OByq2QAn7KtcQ0EKIGpGDncWmrclx8=;
        b=pIYxg1R7m9vnQqdKbVIR5un4B2l3Un3LwX+hxEPaGXXya9jbOzeoRahuaDjAXhYfvh
         24gNT0jU2PrTyyz/mcMjk52OpbB5KMg4KJy3bWV1YN5vI8/IlOH8OQx3Ee1HqHp2RKT2
         pcZGXAacgqU2zcV+Ezh08Scv3fODnPEhrB5yxOan6L2WxkqkwTPLXR9BweT+Haujfee6
         SInnSyamf2lGV2xx0KNG+E2o4WnWM+iYk3E9UhahwqYEmDZnfCf94wOo6pMLPPDOLC6n
         PULs7CgfAU8TenJ72HPhx9EVYymKiEmcGbZ92uGAyAJiw//oKY7GlgYOmgCXjJGvuuoq
         Wepg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id y11si19722982plg.39.2019.04.11.03.47.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 03:47:26 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4019892AC;
	Thu, 11 Apr 2019 10:47:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18C689394
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 11 Apr 2019 10:47:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Apr 2019 03:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,337,1549958400"; d="scan'208";a="160715248"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2019 03:47:23 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2 0/6] Fix issues reported by klocwork
Date: Thu, 11 Apr 2019 13:46:25 +0300
Message-Id: <20190411104631.7627-1-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIGZvdW5kIDExIGNyaXRpY2FsIGlzc3Vl
cyBhbmQgNyBlcnJvcgppc3N1ZXMgaW4gR1ZULWcgc291cmNlIGNvZGUuIEFmdGVyIHRoZSBhbmFs
eXphdGlvbiwgb25lIGNyaXRpY2FsIGlzc3VlCmFuZCA2ICJlcnJvcnMiIHdhcyBjb25jbHVkZWQg
YXMgaGFybWxlc3MuIFRoaXMgcGF0Y2hzZXQgZml4ZXMgb3RoZXIKY2FzZXMsIHdoaWNoIG1pZ2h0
IGNhdXNlIHBvdGVudGlhbCBpc3N1ZXMgaW4gZnV0dXJlLgoKVjI6Ci0gUHJpbnQgc29tZSBlcnJv
ciBtZXNzYWdlcyBpZiBwYWdlIHRhYmxlIHR5cGUgaXMgaW52YWxpZC4gKENvbGluIFh1KQotIElu
Y3JlYXNlIHRoZSBzaXplIG9mIHRoZSBidWZmZXIuIChDb2xpbiBYdSkKLSBJbml0aWFsaXplIGZi
X2luZm8ub2JqIGluIHZncHVfZ2V0X3BsYW5lX2luZm8oKS4gKENvbGluIFh1KQoKCkFsZWtzZWkg
R2ltYml0c2tpaSAoNik6CiAgZHJtL2k5MTUvZ3Z0OiBSZW1vdmUgdHlwZWRlZiBpbnRlbF9ndnRf
Z3R0X3R5cGVfdAogIGRybS9pOTE1L2d2dDogRG8gbm90IGNvcHkgdGhlIHVuaW5pdGlhbGl6ZWQg
cG9pbnRlciBmcm9tIGZiX2luZm8KICBkcm0vaTkxNS9ndnQ6IFVzZSBzbnByaW50ZigpIHRvIHBy
ZXZlbnQgcG9zc2libGUgYnVmZmVyIG92ZXJmbG93LgogIGRybS9pOTE1L2d2dDogQ2hlY2sgaWYg
Y3VyX3B0X3R5cGUgaXMgdmFsaWQKICBkcm0vaTkxNS9ndnQ6IEFzc2lnbiBOVUxMIHRvIHRoZSBw
b2ludGVyIGFmdGVyIG1lbW9yeSBmcmVlLgogIGRybS9pOTE1L2d2dDogQ2hlY2sgaWYgZ2V0X25l
eHRfcHRfdHlwZSgpIGFsd2F5cyByZXR1cm5zIGEgdmFsaWQgdmFsdWUKCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZGVidWdmcy5jIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2RtYWJ1Zi5jICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgIHwg
MjcgKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3R0LmggICAgIHwgMTQgKysrKysrKy0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwg
RmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1
c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kg
CgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlh
bCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocyku
IEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFj
dCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cmlu
dGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
