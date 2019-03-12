Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp2070240ywb;
        Mon, 11 Mar 2019 20:03:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjir09RFcNs3FTJlK3aEjAvssj3+zaZlihoKu6pRowCVSd9/nx7+e2niX9vW6ZCmy0s5Ru
X-Received: by 2002:a63:80c7:: with SMTP id j190mr31829675pgd.357.1552359793473;
        Mon, 11 Mar 2019 20:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552359793; cv=none;
        d=google.com; s=arc-20160816;
        b=GrNMd8Tx7GROttN+t3a89581Y/DUcVG64M3YFNDmoMOJCJYU/34y1tSuzsyJ6TdhsW
         e3mplIO+Rf72IAWKhJih2+ZJKeZkPqRSBp6IrdCoOpzbioQXN8v1uHNXvYiPCtlWNxbV
         PkGusUQzDTbefnFP5Ty5bYwz7A0KFWcE0CwsmC167MBow5IZbOKVb2EAAeyVh63XBjbH
         pcwuiFJKkCC2rxTLC/gMfO1gBL4ZY0ULhGEFTgosbApkzDcAsTpr2DWAnal1lYQH0nqQ
         34pzK9ylxgItzP8zA/aMHYueHgJPmNk4YJoPrHtCmZGTTTqiX2xjGW1RDLEJjtBJOvJs
         OXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=k+phA3jKELEKVzGEEZ5u1m/BI2GGxcofUiKqAc7wyGc=;
        b=h/YaHTP8WrkHJeeuwHX7GnVpL8ZYGhnNfSKpZZO6Bljoqt5bPcDPOwXYEw4DchGqVg
         7FuVrjn8T4dhzWrQUUrz6dUMzFi9P4ZBl3dCTyHwvJ7bm3VKD4i5EUdyS2OAi07hmFVc
         0lj/13WyO1FGvmf0LzOC3Rp0X5F8lYMPm+8I27sQRLwNayY3eAEyRfNIR2OOKoheOjiC
         bExg6KF0UUPpD6naVpMs7g+K5uoiKog47ExADckcZtLgDhg/vkCSIU+ntl9hkAK49xSh
         P88mOQT1uKH6Cn1Sx+NThmJhVmqKOM2IUZ3iP06SKHQ9oKuCJLDmG4PM89c0VP8XD6C8
         O6Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id n21si6656101pfh.44.2019.03.11.20.03.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2019 20:03:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8503089D57;
	Tue, 12 Mar 2019 03:03:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D2C89D57
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 12 Mar 2019 03:03:11 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2019 20:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,469,1544515200"; d="scan'208";a="151455955"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2019 20:03:07 -0700
Date: Mon, 11 Mar 2019 22:57:47 -0400
From: Zhao Yan <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190312025747.GI21353@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190307104421.534ea56f@w520.home>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aGkgQWxleAp0aGFua3MgZm9yIHlvdXIgcmVwbHkuCgpTbywgaWYgd2UgY2hvb3NlIG1pZ3JhdGlv
biBkYXRhIHRvIGJlIHVzZXJzcGFjZSBvcGFxdWUsIGRvIHlvdSB0aGluayBiZWxvdwpzZXF1ZW5j
ZSBpcyB0aGUgcmlnaHQgYmVoYXZpb3IgZm9yIHZlbmRvciBkcml2ZXIgdG8gZm9sbG93OgoKMS4g
aW5pdGlhbGx5IExPR0dJTkcgc3RhdGUgaXMgbm90IHNldC4gSWYgdXNlcnNwYWNlIGNhbGxzIEdF
VF9CVUZGRVIgdG8KdmVuZG9yIGRyaXZlciwgIHZlbmRvciBkcml2ZXIgc2hvdWxkIHJlamVjdCBh
bmQgcmV0dXJuIDAuCgoyLiB0aGVuIExPR0dJTkcgc3RhdGUgaXMgc2V0LCBpZiB1c2Vyc3BhY2Ug
Y2FsbHMgR0VUX0JVRkZFUiB0byB2ZW5kb3IKZHJpdmVyLAogICBhLiB2ZW5kb3IgZHJpdmVyIHNo
b3VkIGZpcnN0IHF1ZXJ5IGEgd2hvbGUgc25hcHNob3Qgb2YgZGV2aWNlIG1lbW9yeQogICAobGV0
J3MgdXNlIHRoaXMgdGVybSB0byByZXByZXNlbnQgZGV2aWNlJ3Mgc3RhbmRhbG9uZSBtZW1vcnkg
Zm9yIG5vdyksCiAgIGIuIHZlbmRvciBkcml2ZXIgcmV0dXJucyBhIGNodW5rIG9mIGRhdGEganVz
dCBxdWVyaWVkIHRvIHVzZXJzcGFjZSwKICAgd2hpbGUgcmVjb3JkaW5nIGN1cnJlbnQgcG9zIGlu
IGRhdGEuCiAgIGMuIHZlbmRvciBkcml2ZXIgZmluZHMgYWxsIGRhdGEganVzdCBxdWVyaWVkIGlz
IGZpbmlzaGVkIHRyYW5zbWl0dGluZyB0bwogICB1c2Vyc3BhY2UsIGFuZCBxdWVyaWVzIG9ubHkg
ZGlydHkgZGF0YSBpbiBkZXZpY2UgbWVtb3J5IG5vdy4KICAgZC4gdmVuZG9yIGRyaXZlciByZXR1
cm5zIGEgY2h1bmsgb2YgZGF0YSBqdXN0IHF1ZXJlZCAodGhpcyB0aW1lIGlzIGRpcnR5CiAgIGRh
dGEgKXRvIHVzZXJzcGFjZSB3aGlsZSByZWNvcmRpbmcgY3VycmVudCBwb3MgaW4gZGF0YQogICBl
LiBpZiBhbGwgZGF0YSBpcyB0cmFuc21pdGVkIHRvIHVzZXNwYWNlIGFuZCBzdGlsbCBHRVRfQlVG
RkVScyBjb21lIGZyb20KICAgdXNlcnNwYWNlLCB2ZW5kb3IgZHJpdmVyIHN0YXJ0cyBhbm90aGVy
IHJvdW5kIG9mIGRpcnR5IGRhdGEgcXVlcnkuCgozLiBpZiBMT0dHSU5HIHN0YXRlIGlzIHVuc2V0
IHRoZW4sIGFuZCB1c2VycGFjZSBjYWxscyBHRVRfQlVGRkVSIHRvIHZlbmRvcgpkcml2ZXIsCiAg
IGEuIGlmIHZlbmRvciBkcml2ZXIgZmluZHMgdGhlcmUncyBwcmV2aW91c2x5IHVudHJhbnNtaXR0
ZWQgZGF0YSwgcmV0dXJucwogICB0aGVtIHVudGlsIGFsbCB0cmFuc21pdHRlZC4KICAgYi4gdmVu
ZG9yIGRyaXZlciB0aGVuIHF1ZXJpZXMgZGlydHkgZGF0YSBhZ2FpbiBhbmQgdHJhbnNtaXRzIHRo
ZW0uCiAgIGMuIGF0IGxhc3QsIHZlbmRvciBkcml2ZXIgcXVlcmlzIGRldmljZSBjb25maWcgZGF0
YSAod2hpY2ggaGFzIHRvIGJlCiAgIHF1ZXJpZWQgYXQgbGFzdCBhbmQgc2VudCBvbmNlKSBhbmQg
dHJhbnNtaXRzIHRoZW0uCgoKZm9yIHRoZSAxIGJ1bGxldCwgaWYgTE9HR0lORyBzdGF0ZSBpcyBm
aXJzdGx5IHNldCBhbmQgbWlncmF0aW9uIGFib3J0cwp0aGVuLCAgdmVuZG9yIGRyaXZlciBoYXMg
dG8gYmUgYWJsZSB0byBkZXRlY3QgdGhhdCBjb25kaXRpb24uIHNvIHNlZW1pbmdseSwKdmVuZG9y
IGRyaXZlciBoYXMgdG8ga25vdyBtb3JlIHFlbXUncyBtaWdyYXRpb24gc3RhdGUsIGxpa2UgbWln
cmF0aW9uCmNhbGxlZCBhbmQgZmFpbGVkLiBEbyB5b3UgdGhpbmsgdGhhdCdzIGFjY2VwdGFibGU/
CgoKVGhhbmtzCllhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW50ZWwtZ3Z0LWRldg==
