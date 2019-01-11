Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2597696ywd;
        Thu, 10 Jan 2019 21:58:56 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7sU2AWYjl4RMvZxoR3Kh5+mmep0DBD0/CPiSCH391pwpM0skWYb7PzGd629nl4KB3L4nhV
X-Received: by 2002:a62:1e45:: with SMTP id e66mr13093820pfe.152.1547186336080;
        Thu, 10 Jan 2019 21:58:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547186336; cv=none;
        d=google.com; s=arc-20160816;
        b=ES14KrA3IZ1X2bosKYpMI88jNn0cVJi5s68JN+/WO/g5QNek4SsY25ZyPgzDTXOtKZ
         +DEWUoarR5BlBA8e5ZrA6CBQ6mw3o0lIuhxTWmIq7Fac1xiUqYrmrm6yqP+FC8iO+udz
         4AtrxzrswB6h2pHfonnUfgKjGcDumnCb4IahDHCbzmQe2r+tdvsdOTXq6qKVyMIY6Bvh
         oUpXCOCrIvwjh8TEyUix30y/MoVhU6knAeLaOIbhDbkfAIjIniFVfWsJsYC7xq3q2Atz
         ubm0UFMY7+2bZdW8sRwvy1d+Nua0mdzEd2Tg6531ju0Eu3s1Bh+mPT8v3tw0QMvSSti2
         HjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=dHzT4Sat3vYLMGoJhcQtabkvMgtlCHAbv/J/ZzF+eD4=;
        b=y7YKpXo1CYi8U1mwIeCwRsmvlx8SYeUY4UwnKM/EkaRwxcYyqXlLQnBJ1e11ZWhU2i
         cYGKTkJ6ZZNtBm+fDSyHXAhvdD6gSqchYV+pdSxCnaInVyvaeJa17/1oEt6HzQNFxf4m
         YASQr0avLAXgw45RJGF1KbYC/YUMmkcJkbvQcVmTpWQwC7cMHOBMgji9jhQOkSbje8NC
         Ok9yHx+7Qjx4YSTV3WuM7kbrMkTM0C5bjsKgCfTNCLiWYkc+1tyMZbHF2L9OsEtj36Jb
         irHGtZRZXwZ7sbtqecXlywQJPFq5VAcAWvsO6a/O74vReHq4rrDGwZI8dtL3RYQusHC2
         OUQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id q127si6611162pfq.19.2019.01.10.21.58.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 21:58:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465226E100;
	Fri, 11 Jan 2019 05:58:55 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DEF6E100
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 05:58:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 21:58:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,464,1539673200"; d="scan'208";a="137315938"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jan 2019 21:58:51 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: Fix mmap range check
Date: Fri, 11 Jan 2019 13:58:53 +0800
Message-Id: <20190111055853.1943-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: "Monroy, Rodrigo Axel" <rodrigo.axel.monroy@intel.com>, "Orrala Contreras,
 Alfredo" <alfredo.orrala.contreras@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBpcyB0byBmaXggbWlzc2VkIG1tYXAgcmFuZ2UgY2hlY2sgb24gdkdQVSBiYXIyIHJlZ2lv
bgphbmQgb25seSBhbGxvdyB0byBtYXAgdkdQVSBhbGxvY2F0ZWQgR01BRERSIHJhbmdlLCB3aGlj
aCBtZWFucwp1c2VyIHNwYWNlIHNob3VsZCBzdXBwb3J0IHNwYXJzZSBtbWFwIHRvIGdldCBwcm9w
ZXIgb2Zmc2V0IGZvcgptbWFwIHZHUFUgYXBlcnR1cmUuIEFuZCB0aGlzIHRha2VzIGNhcmUgb2Yg
YWN0dWFsIHBnb2ZmIGluIG1tYXAKcmVxdWVzdCBhcyBvcmlnaW5hbCBjb2RlIGFsd2F5cyBkb2Vz
IGZyb20gYmVnaW5uaW5nIG9mIHZHUFUKYXBlcnR1cmUuCgpGaXhlczogNjU5NjQzZjdkODE0ICgi
ZHJtL2k5MTUvZ3Z0L2t2bWd0OiBhZGQgdmZpby9tZGV2IHN1cHBvcnQgdG8gS1ZNR1QiKQpDYzog
Ik1vbnJveSwgUm9kcmlnbyBBeGVsIiA8cm9kcmlnby5heGVsLm1vbnJveUBpbnRlbC5jb20+CkNj
OiAiT3JyYWxhIENvbnRyZXJhcywgQWxmcmVkbyIgPGFsZnJlZG8ub3JyYWxhLmNvbnRyZXJhc0Bp
bnRlbC5jb20+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgdjQuMTArClNpZ25lZC1vZmYt
Ynk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyB8IDE0ICsrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9rdm1n
dC5jCmluZGV4IGExOWU2ODRlNjIxYS4uNTQ4OGMyZTJhM2ZmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQva3ZtZ3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
a3ZtZ3QuYwpAQCAtMTAwNSw3ICsxMDA1LDcgQEAgc3RhdGljIGludCBpbnRlbF92Z3B1X21tYXAo
c3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIHsK
IAl1bnNpZ25lZCBpbnQgaW5kZXg7CiAJdTY0IHZpcnRhZGRyOwotCXVuc2lnbmVkIGxvbmcgcmVx
X3NpemUsIHBnb2ZmID0gMDsKKwl1bnNpZ25lZCBsb25nIHJlcV9zaXplLCBwZ29mZiwgcmVxX3N0
YXJ0OwogCXBncHJvdF90IHBnX3Byb3Q7CiAJc3RydWN0IGludGVsX3ZncHUgKnZncHUgPSBtZGV2
X2dldF9kcnZkYXRhKG1kZXYpOwogCkBAIC0xMDIzLDcgKzEwMjMsMTcgQEAgc3RhdGljIGludCBp
bnRlbF92Z3B1X21tYXAoc3RydWN0IG1kZXZfZGV2aWNlICptZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSkKIAlwZ19wcm90ID0gdm1hLT52bV9wYWdlX3Byb3Q7CiAJdmlydGFkZHIgPSB2
bWEtPnZtX3N0YXJ0OwogCXJlcV9zaXplID0gdm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0Owot
CXBnb2ZmID0gdmdwdV9hcGVydHVyZV9wYV9iYXNlKHZncHUpID4+IFBBR0VfU0hJRlQ7CisJcGdv
ZmYgPSB2bWEtPnZtX3Bnb2ZmICYKKwkJKCgxVSA8PCAoVkZJT19QQ0lfT0ZGU0VUX1NISUZUIC0g
UEFHRV9TSElGVCkpIC0gMSk7CisJcmVxX3N0YXJ0ID0gcGdvZmYgPDwgUEFHRV9TSElGVDsKKwor
CWlmICghaW50ZWxfdmdwdV9pbl9hcGVydHVyZSh2Z3B1LCByZXFfc3RhcnQpKQorCQlyZXR1cm4g
LUVJTlZBTDsKKwlpZiAocmVxX3N0YXJ0ICsgcmVxX3NpemUgPgorCSAgICB2Z3B1X2FwZXJ0dXJl
X29mZnNldCh2Z3B1KSArIHZncHVfYXBlcnR1cmVfc3oodmdwdSkpCisJCXJldHVybiAtRUlOVkFM
OworCisJcGdvZmYgPSAoZ3Z0X2FwZXJ0dXJlX3BhX2Jhc2UodmdwdS0+Z3Z0KSA+PiBQQUdFX1NI
SUZUKSArIHBnb2ZmOwogCiAJcmV0dXJuIHJlbWFwX3Bmbl9yYW5nZSh2bWEsIHZpcnRhZGRyLCBw
Z29mZiwgcmVxX3NpemUsIHBnX3Byb3QpOwogfQotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYK
