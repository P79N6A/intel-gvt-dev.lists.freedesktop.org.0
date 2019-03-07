Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7374395ywe;
        Thu, 7 Mar 2019 15:20:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHdIk95S72mfG4r35jLQ22aTP3L1dbJjATYnkp4Wsl4dTkjuq58oGwbCsu1p6HIwUm1Uzq
X-Received: by 2002:a17:902:2d24:: with SMTP id o33mr10519934plb.157.1552000843184;
        Thu, 07 Mar 2019 15:20:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552000843; cv=none;
        d=google.com; s=arc-20160816;
        b=VHRCjfD88ziebBqO9iOvztjswwTn5YM5+GeY0DKOa17ljKnFs6k9ZR4vE7KouLJ34v
         si3TSAIN6QhQO8dT3+E++KHOkKndjccTBcUk7wikmQ0jveRkJ/23fkxRhlQO9KbwHIWl
         so2G8VbWfm5q9nc/LXSRmT6OB4wleUWEQ0GPr3rKfWANaxJcgCFDI9hufo+3rOVQwdlo
         VBHVkyK/L6Vfv2sqkFnT8TIpTy40udS2eG3KT9ET7zFRdDIlfRBasPWW9h7wMULzt/Gu
         a3jlgSNErqriUitPjo8c6qtSdqj2XYNR6Wk0uxnyrRHwVE3FY/C9jVTd+7J8qPXZOIek
         CuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=wsXTY/9Od5b/VplZJo+WsfbLNwXLnPjqvJ1WAUS3GaU=;
        b=LMtZP1jqDOij1Fn64d4gCWV+0lNBDCSoFJx1sYTzdwpLUw/LVAi4iccuNIj60NVyn4
         MIpc/53s7eWF3KdY+q2PYZpo4I0BtYYCrU40ufzLemMFZoe0yfMmQoucq75eVC/moDlU
         a2GbJsB3Y5MJ6did+8QUKM4wh3xfjwyBWTygAeGVLqYz4gu8oHtzlrrkEnaeRnNJB4nY
         lcNZ1Tn/ZWWK11qhYRomClZHbQ2a6lvIbuuS3w5IlU0lSQIBohVfsIuA0q3g7N0pr5Sj
         aJTMfcPAOtk42q/JhtbcPov5LW+kX1+tZ8sNoivFp0FKay1XF5ylPFAIieV4CYZWwWK0
         5tZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id w9si5222489pll.389.2019.03.07.15.20.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 15:20:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840FA6E244;
	Thu,  7 Mar 2019 23:20:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB8E6E244
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu,  7 Mar 2019 23:20:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 15:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,453,1544515200"; d="scan'208";a="140096493"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga002.jf.intel.com with ESMTP; 07 Mar 2019 15:20:39 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 15:20:39 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 7 Mar 2019 15:20:38 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.113]) with mapi id 14.03.0415.000;
 Fri, 8 Mar 2019 07:20:36 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Zhao, Yan Y"
 <yan.y.zhao@intel.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBZ+rAJaWhuwUultlHIVQiP6qXqNPqAgAUWkgCAELjBgIAA31UQ
Date: Thu, 7 Mar 2019 23:20:36 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
In-Reply-To: <20190307104421.534ea56f@w520.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDM1ZWMzZDItODVmOS00NDdiLWFjZDktYTE3MWZhNzMzODA0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTWpTOWtZbHhqYUdDVFgwc09KSVpcL1BidG00WjNGWWkrU1hWVWQwXC9NVEZ6Ynp4YjM2NGhiXC9zR3Z1UUxJaGtZMyJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gW21haWx0bzphbGV4LndpbGxpYW1zb25AcmVkaGF0LmNv
bV0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDgsIDIwMTkgMTo0NCBBTQo+ID4gPgo+ID4gPiA+ICAg
ICAgICAgVGhpcyBraW5kIG9mIGRhdGEgbmVlZHMgdG8gYmUgc2F2ZWQgLyBsb2FkZWQgaW4gcHJl
LWNvcHkgYW5kCj4gPiA+ID4gICAgICAgICBzdG9wLWFuZC1jb3B5IHBoYXNlLgo+ID4gPiA+ICAg
ICAgICAgVGhlIGRhdGEgb2YgZGV2aWNlIG1lbW9yeSBpcyBoZWxkIGluIGRldmljZSBtZW1vcnkg
cmVnaW9uLgo+ID4gPiA+ICAgICAgICAgU2l6ZSBvZiBkZXZpZSBtZW1vcnkgaXMgdXN1YWxseSBs
YXJnZXIgdGhhbiB0aGF0IG9mIGRldmljZQo+ID4gPiA+ICAgICAgICAgbWVtb3J5IHJlZ2lvbi4g
cWVtdSBuZWVkcyB0byBzYXZlL2xvYWQgaXQgaW4gY2h1bmtzIG9mIHNpemUgb2YKPiA+ID4gPiAg
ICAgICAgIGRldmljZSBtZW1vcnkgcmVnaW9uLgo+ID4gPiA+ICAgICAgICAgTm90IGFsbCBkZXZp
Y2UgaGFzIGRldmljZSBtZW1vcnkuIExpa2UgSUdEIG9ubHkgdXNlcyBzeXN0ZW0KPiBtZW1vcnku
Cj4gPiA+Cj4gPiA+IEl0IHNlZW1zIGEgbGl0dGxlIGdyYXR1aXRvdXMgdG8gbWUgdGhhdCB0aGlz
IGlzIGEgc2VwYXJhdGUgcmVnaW9uIG9yCj4gPiA+IHRoYXQgdGhpcyBkYXRhIGlzIGhhbmRsZWQg
c2VwYXJhdGVseS4gIEFsbCBvZiB0aGlzIGRhdGEgaXMgb3BhcXVlIHRvCj4gPiA+IFFFTVUsIHNv
IHdoeSBkbyB3ZSBuZWVkIHRvIHNlcGFyYXRlIGl0Pwo+ID4gaGkgQWxleCwKPiA+IGFzIHRoZSBk
ZXZpY2Ugc3RhdGUgaW50ZXJmYWNlcyBhcmUgcHJvdmlkZWQgYnkga2VybmVsLCBpdCBpcyBleHBl
Y3RlZCB0bwo+ID4gbWVldCBhcyBnZW5lcmFsIG5lZWRzIGFzIHBvc3NpYmxlLiBTbywgZG8geW91
IHRoaW5rIHRoZXJlIGFyZSBzdWNoIHVzZQo+ID4gY2FzZXMgZnJvbSB1c2VyIHNwYWNlIHRoYXQg
dXNlciBzcGFjZSBrbm93cyB3ZWxsIG9mIHRoZSBkZXZpY2UsIGFuZAo+ID4gaXQgd2FudHMga2Vy
bmVsIHRvIHJldHVybiBkZXNpcmVkIGRhdGEgYmFjayB0byBpdC4KPiA+IEUuZy4gSXQganVzdCB3
YW50cyB0byBnZXQgd2hvbGUgZGV2aWNlIGNvbmZpZyBkYXRhIGluY2x1ZGluZyBhbGwgbW1pb3Ms
Cj4gPiBwYWdlIHRhYmxlcywgcGNpIGNvbmZpZyBkYXRhLi4uCj4gPiBvciwgSXQganVzdCB3YW50
cyB0byBnZXQgY3VycmVudCBkZXZpY2UgbWVtb3J5IHNuYXBzaG90LCBub3QgaW5jbHVkaW5nIGFu
eQo+ID4gZGlydHkgZGF0YS4KPiA+IE9yLCBJdCBqdXN0IG5lZWRzIHRoZSBkaXJ0eSBwYWdlcyBp
biBkZXZpY2UgbWVtb3J5IG9yIHN5c3RlbSBtZW1vcnkuCj4gPiBXaXRoIGFsbCB0aGlzIGFjY3Vy
YXRlIHF1ZXJ5LCBxdWl0ZSBhIGxvdCBvZiB1c2VmdWwgZmVhdHVyZXMgY2FuIGJlCj4gPiBkZXZl
bG9wcGVkIGluIHVzZXIgc3BhY2UuCj4gPgo+ID4gSWYgYWxsIG9mIHRoaXMgZGF0YSBpcyBvcGFx
dWUgdG8gdXNlciBhcHAsIHNlZW1zIHRoZSBvbmx5IHVzZSBjYXNlIGlzCj4gPiBmb3IgbGl2ZSBt
aWdyYXRpb24uCj4gCj4gSSBjYW4gY2VydGFpbmx5IGFwcHJlY2lhdGUgYSBtb3JlIHZlcnNhdGls
ZSBpbnRlcmZhY2UsIGJ1dCBJIHRoaW5rCj4gd2UncmUgYWxzbyB0cnlpbmcgdG8gY3JlYXRlIHRo
ZSBtb3N0IHNpbXBsZSBpbnRlcmZhY2Ugd2UgY2FuLCB3aXRoIHRoZQo+IHByaW1hcnkgdGFyZ2V0
IGJlaW5nIGxpdmUgbWlncmF0aW9uLiAgQXMgc29vbiBhcyB3ZSBzdGFydCBkZWZpbmluZyB0aGlz
Cj4gdHlwZSBvZiBkZXZpY2UgbWVtb3J5IGFuZCB0aGF0IHR5cGUgb2YgZGV2aWNlIG1lbW9yeSwg
d2UncmUgZ29pbmcgdG8KPiBoYXZlIGFub3RoZXIgZGV2aWNlIGNvbWUgYWxvbmcgdGhhdCBuZWVk
cyB5ZXQgYW5vdGhlciBiZWNhdXNlIHRoZXkgaGF2ZQo+IGEgc2xpZ2h0bHkgZGlmZmVyZW50IHJl
cXVpcmVtZW50LiAgRXZlbiB3aXRob3V0IHRoYXQsIHdlJ3JlIGdvaW5nIHRvCj4gaGF2ZSB2ZW5k
b3IgZHJpdmVycyBpbXBsZW1lbnQgaXQgZGlmZmVyZW50bHksIHNvIHdoYXQgd29ya3MgZm9yIG9u
ZQo+IGRldmljZSBmb3IgYSBtb3JlIHRhcmdldGVkIGFwcHJvYWNoIG1heSBub3Qgd29yayBmb3Ig
YWxsIGRldmljZXMuICBDYW4KPiB5b3UgZW51bWVyYXRlIHNvbWUgc3BlY2lmaWMgZXhhbXBsZXMg
b2YgdGhlIHVzZSBjYXNlcyB5b3UgaW1hZ2luZSB5b3VyCj4gZGVzaWduIHRvIGVuYWJsZT8KPiAK
CkRvIHdlIHdhbnQgdG8gY29uc2lkZXIgYW4gdXNlIGNhc2Ugd2hlcmUgdXNlciBzcGFjZSB3b3Vs
ZCBsaWtlIHRvCnNlbGVjdGl2ZWx5IGludHJvc3BlY3QgYSBwb3J0aW9uIG9mIHRoZSBkZXZpY2Ug
c3RhdGUgKGluY2x1ZGluZyBpbXBsaWNpdCAKc3RhdGUgd2hpY2ggYXJlIG5vdCBhdmFpbGFibGUg
dGhyb3VnaCBQQ0kgcmVnaW9ucyksIGFuZCBtYXkgYXNrIGZvcgpjYXBhYmlsaXR5IG9mIGRpcmVj
dCBtYXBwaW5nIG9mIHNlbGVjdGVkIHBvcnRpb24gZm9yIHNjYW5uaW5nIChlLmcuCmRldmljZSBt
ZW1vcnkpIGluc3RlYWQgb2YgYWx3YXlzIHR1cm5pbmcgb24gZGlydHkgbG9nZ2luZyBvbiBhbGwK
ZGV2aWNlIHN0YXRlPwoKVGhhbmtzCktldmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
