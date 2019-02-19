Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3076684ywa;
        Tue, 19 Feb 2019 00:52:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZHvXxNPPYyiqDLt0CwsCsK1xpFaOIkajfTQ/j3SRgGHxiuPIigs8/v8CeeTe9bkjV/Rhvg
X-Received: by 2002:a63:c22:: with SMTP id b34mr23155629pgl.398.1550566369353;
        Tue, 19 Feb 2019 00:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550566369; cv=none;
        d=google.com; s=arc-20160816;
        b=yojPsQ1WjSr7EgfR7D8J5CyeFbW6a4QH/F/lRT/Pm71CwhIC+XKfyG74UokEu4j7A8
         yzGA948t5rECTX5CoAvHBkiUAoJXEhyXomNMxFnAonDgmRPT7v8W1BHW7ZMhvfp+0bEw
         qx8jYiYUaXcfl5AhuuZYGgu7Zf166ory7UMwj7u2qDhA8IMBeSyzWkF9rS0IECVr/3G/
         K5E/Q39/lYuNa/pA5U+2U2muOcZWc5YsYxn0XieZcyQj+zgryz37yHB28uGz9c4fV+Jv
         TJLLxoS+r8+vLR13amBSbDar6XCQUoZveUuxYh88nKtyOExPM3GBDmdONi/6GBXCXVsO
         GqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=JT+yT9yV7gbF22OMqrMOlm8Zjl2BZG0bownm5pHO6tU=;
        b=RhetAlSPgkVmfgqAcuBHLwRTAPajezPPwJQlBVgr0DRCEgHunw2pg2NvKVKuUQWN3G
         LdSSonysqwe4GYIeCrX/fDkvsZF131cXD2ePuCCf29Th9u1ctsEvjoU5pEgzA4bWEtzd
         gOaN7AylOor6dhXFHjqUjvqYwfBrVsMmVvNwL+HlF5XT1Omymu5LUCAzyVjzTZztjkL3
         fw5r0GPXRjw8jM/NQZDM2xcqnVuYPljNiyyzyATkieWVYmPtYkrLB1JeW6R6r8/49LPz
         pMjIZRJ5kdbXCh4OQON+V62leurhyCsIMhGqXWWcAAZH1Qmj6jdK271+L/Be/838QKMO
         R94A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f24si15300948pgb.398.2019.02.19.00.52.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 00:52:49 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F018F891DC;
	Tue, 19 Feb 2019 08:52:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85E891DC
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 08:52:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 00:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="123524385"
Received: from joy-desktop.sh.intel.com ([10.239.13.17])
 by fmsmga007.fm.intel.com with ESMTP; 19 Feb 2019 00:52:42 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: alex.williamson@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] vfio/migration: tracking of dirty page in system memory
Date: Tue, 19 Feb 2019 16:52:41 +0800
Message-Id: <1550566361-3697-1-git-send-email-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 kwankhede@nvidia.com, eauger@redhat.com, yi.l.liu@intel.com,
 eskultet@redhat.com, ziye.yang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, arei.gonglei@huawei.com, felipe@nutanix.com,
 Ken.Xue@amd.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 dgilbert@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, cohuck@redhat.com, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

cmVnaXN0ZXIgdGhlIGxvZ19zeW5jIGludGVyZmFjZSB0byBob29rIGludG8gcmFtJ3MgbGl2ZSBt
aWdyYXRpb24KY2FsbGJhY2tzLgoKcmFtX3NhdmVfcGVuZGluZwogICB8LT5taWdyYXRpb25fYml0
bWFwX3N5bmMKICAgICAgIHwtPm1lbW9yeV9nbG9iYWxfZGlydHlfbG9nX3N5bmMKICAgICAgICAg
ICB8LT5tZW1vcnlfcmVnaW9uX3N5bmNfZGlydHlfYml0bWFwCiAgICAgICAgICAgICAgIHwtPmxp
c3RlbmVyLT5sb2dfc3luYyhsaXN0ZW5lciwgJm1ycyk7CgpTbywgdGhlIGRpcnR5IHBhZ2UgcHJv
ZHVjZWQgYnkgdmZpbyBkZXZpY2UgaW4gc3lzdGVtIG1lbW9yeSB3aWxsIGJlCnNhdmUvbG9hZCBi
eSByYW0ncyBsaXZlIG1pZ3JhdGlvbiBjb2RlIGl0ZXJhdGl2ZWx5LgoKQml0bWFwIG9mIGRldmlj
ZSdzIGRpcnR5IHBhZ2UgaW4gc3lzdGVtIG1lbW9yeSBpcyByZXRyaWV2ZWQgZnJvbSBEaXJ0eSBC
aXRtYXAKUmVnaW9uCgpTaWduZWQtb2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IFl1bGVpIFpoYW5nIDx5dWxlaS56aGFuZ0BpbnRlbC5jb20+Ci0t
LQogaHcvdmZpby9jb21tb24uYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2h3L3ZmaW8vY29tbW9u
LmMgYi9ody92ZmlvL2NvbW1vbi5jCmluZGV4IDdjMTg1ZTVhLi43MTllNzUwIDEwMDY0NAotLS0g
YS9ody92ZmlvL2NvbW1vbi5jCisrKyBiL2h3L3ZmaW8vY29tbW9uLmMKQEAgLTI3LDYgKzI3LDcg
QEAKIAogI2luY2x1ZGUgImh3L3ZmaW8vdmZpby1jb21tb24uaCIKICNpbmNsdWRlICJody92Zmlv
L3ZmaW8uaCIKKyNpbmNsdWRlICJody92ZmlvL3BjaS5oIgogI2luY2x1ZGUgImV4ZWMvYWRkcmVz
cy1zcGFjZXMuaCIKICNpbmNsdWRlICJleGVjL21lbW9yeS5oIgogI2luY2x1ZGUgImh3L2h3Lmgi
CkBAIC02OTgsOSArNjk5LDM0IEBAIHN0YXRpYyB2b2lkIHZmaW9fbGlzdGVuZXJfcmVnaW9uX2Rl
bChNZW1vcnlMaXN0ZW5lciAqbGlzdGVuZXIsCiAgICAgfQogfQogCitzdGF0aWMgdm9pZCB2Zmlv
X2xvZ19zeW5jKE1lbW9yeUxpc3RlbmVyICpsaXN0ZW5lciwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgTWVtb3J5UmVnaW9uU2VjdGlvbiAqc2VjdGlvbikKK3sKKyAgICBWRklPQ29udGFpbmVy
ICpjb250YWluZXIgPSBjb250YWluZXJfb2YobGlzdGVuZXIsIFZGSU9Db250YWluZXIsIGxpc3Rl
bmVyKTsKKyAgICBWRklPR3JvdXAgKmdyb3VwID0gUUxJU1RfRklSU1QoJmNvbnRhaW5lci0+Z3Jv
dXBfbGlzdCk7CisgICAgVkZJT0RldmljZSAqdmJhc2VkZXY7CisgICAgVkZJT1BDSURldmljZSAq
dmRldjsKKworICAgIHJhbV9hZGRyX3Qgc2l6ZSA9IGludDEyOF9nZXQ2NChzZWN0aW9uLT5zaXpl
KTsKKyAgICB1aW50NjRfdCBwYWdlX25yID0gc2l6ZSA+PiBUQVJHRVRfUEFHRV9CSVRTOworICAg
IHVpbnQ2NF90IHN0YXJ0X2FkZHIgPSBzZWN0aW9uLT5vZmZzZXRfd2l0aGluX2FkZHJlc3Nfc3Bh
Y2U7CisKKyAgICBRTElTVF9GT1JFQUNIKHZiYXNlZGV2LCAmZ3JvdXAtPmRldmljZV9saXN0LCBu
ZXh0KSB7CisgICAgICAgIHZkZXYgPSBjb250YWluZXJfb2YodmJhc2VkZXYsIFZGSU9QQ0lEZXZp
Y2UsIHZiYXNlZGV2KTsKKyAgICAgICAgaWYgKCF2ZGV2LT5taWdyYXRpb24gfHwKKyAgICAgICAg
ICAgICAgICAhdmZpb19kZXZpY2VfZGF0YV9jYXBfc3lzdGVtX21lbW9yeSh2ZGV2KSB8fAorICAg
ICAgICAgICAgICAgICEodmRldi0+bWlncmF0aW9uLT5kZXZpY2Vfc3RhdGUgJiBWRklPX0RFVklD
RV9TVEFURV9MT0dHSU5HKSkgeworICAgICAgICAgICAgY29udGludWU7CisgICAgICAgIH0KKwor
ICAgICAgICB2ZmlvX3NldF9kaXJ0eV9wYWdlX2JpdG1hcCh2ZGV2LCBzdGFydF9hZGRyLCBwYWdl
X25yKTsKKyAgICB9Cit9CisKIHN0YXRpYyBjb25zdCBNZW1vcnlMaXN0ZW5lciB2ZmlvX21lbW9y
eV9saXN0ZW5lciA9IHsKICAgICAucmVnaW9uX2FkZCA9IHZmaW9fbGlzdGVuZXJfcmVnaW9uX2Fk
ZCwKICAgICAucmVnaW9uX2RlbCA9IHZmaW9fbGlzdGVuZXJfcmVnaW9uX2RlbCwKKyAgICAubG9n
X3N5bmMgPSB2ZmlvX2xvZ19zeW5jLAogfTsKIAogc3RhdGljIHZvaWQgdmZpb19saXN0ZW5lcl9y
ZWxlYXNlKFZGSU9Db250YWluZXIgKmNvbnRhaW5lcikKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcg
bGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
