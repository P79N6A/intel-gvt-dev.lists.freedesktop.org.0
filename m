Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp956517ywb;
        Sun, 10 Mar 2019 19:35:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1GI+5S6uHBNroi92hx8/zfbEOkGr+U1pMuxUWXFohg9hj97vZ7oCiDHmCedbH0Bo+r1BL
X-Received: by 2002:a62:fc10:: with SMTP id e16mr31359102pfh.83.1552271747402;
        Sun, 10 Mar 2019 19:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552271747; cv=none;
        d=google.com; s=arc-20160816;
        b=sKDhX+IvH4Wz3tDXagLj//k2j4AgR0/jeQs+jx3oqexyfQO0LYV4NBCIPWZ9+SU02a
         widGjdCag49LWQaGg7e76WSq1mfGhiJxmxDR0wfBsUwIB9aTkN4bR13VMt1U9+Iq3lti
         ls/5ahosOoZh4fMZNMgxtvW45w0nFwTdOCR+gndC3S8ER0fMExWqE9ut28OTwdg2he/O
         lSYXNbc/IBrhhxNd+nhMs1+sABbBfhI5amGsuSjmsb3BqvCPBgWVs5jMp8e/resWHQyn
         wtgrs6SOa7fLYKiPyhm8/9ZuwF1XMdesUGq587/haeuZV2lA/NVOY+LkNGjc/jIBtiKu
         mcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=zRkPapbTZK7MUunOXeD6OmwDnP3lPP86Mx5O429akK4=;
        b=gTeZsC2ExV8JpX1tYgssAKxZvWW/hEFHoMbcp4Xy4YOLShVhsOhv0qcDXqdel2pBCM
         nSfMm8+qqlI76d2wJLWypPOQT5J1L05x1lkvqPU0Uhfx0O/EY44KG6UgC1wnb8VNlsOl
         5YfQDNN/75VUq2eT7ny7WQl7Xxq36mtA8LCh8jeORmQ3WeOT4pGc0QY5AWw3zfEDOXfJ
         ua23B+Gy5D2WUKVM5jTgdIxRFxU+2ghdwLxTNtgJNh6uKFrnBsOJiVUvQnT0JoahakUk
         FugtyiRVazlsgklXhbSwupNeuo4eUFXrtQOZPnE7DKC0m7ORN7nUL0nsGqo0JwJKCTJ8
         lxuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id i22si4050269pgj.178.2019.03.10.19.35.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 19:35:47 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF272896AF;
	Mon, 11 Mar 2019 02:35:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7F8896AF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 02:35:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 19:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; d="scan'208";a="130505796"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2019 19:35:44 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 10 Mar 2019 19:35:44 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 10 Mar 2019 19:35:42 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.113]) with mapi id 14.03.0415.000;
 Mon, 11 Mar 2019 10:33:12 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBZ+rAJaWhuwUultlHIVQiP6qXqNPqAgAUWkgCAELjBgIAA31UQgACZEoCAAALbAIAAX1AAgAPuAMA=
Date: Mon, 11 Mar 2019 02:33:11 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C983C63@SHSMSX104.ccr.corp.intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
 <20190308091133.3073f5db@x1.home> <20190308162146.GD2834@work-vm>
 <20190308150254.3d1af7d8@x1.home>
In-Reply-To: <20190308150254.3d1af7d8@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjk0MDczZDItMzEyMi00ODUxLTkzYjYtNjVkNjdhNjc5NmZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR0JUR0FaUnVUTjljd05WekdPOEhtaUgzZVk4d1wvQUphNDQ4ZENwcEZFTE96clhYMlA2d2pJaXpMdE5LUmtcL1ZFIn0=
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
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang, 
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24NCj4gU2VudDogU2F0dXJkYXksIE1hcmNoIDksIDIwMTkg
NjowMyBBTQ0KPiANCj4gT24gRnJpLCA4IE1hciAyMDE5IDE2OjIxOjQ2ICswMDAwDQo+ICJEci4g
RGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiA+
ICogQWxleCBXaWxsaWFtc29uIChhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbSkgd3JvdGU6DQo+
ID4gPiBPbiBUaHUsIDcgTWFyIDIwMTkgMjM6MjA6MzYgKzAwMDANCj4gPiA+ICJUaWFuLCBLZXZp
biIgPGtldmluLnRpYW5AaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiA+ID4gRnJvbTog
QWxleCBXaWxsaWFtc29uIFttYWlsdG86YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb21dDQo+ID4g
PiA+ID4gU2VudDogRnJpZGF5LCBNYXJjaCA4LCAyMDE5IDE6NDQgQU0NCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIFRoaXMga2luZCBvZiBkYXRhIG5lZWRzIHRvIGJlIHNh
dmVkIC8gbG9hZGVkIGluIHByZS1jb3B5IGFuZA0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgc3Rv
cC1hbmQtY29weSBwaGFzZS4NCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIFRoZSBkYXRhIG9mIGRl
dmljZSBtZW1vcnkgaXMgaGVsZCBpbiBkZXZpY2UgbWVtb3J5IHJlZ2lvbi4NCj4gPiA+ID4gPiA+
ID4gPiAgICAgICAgIFNpemUgb2YgZGV2aWUgbWVtb3J5IGlzIHVzdWFsbHkgbGFyZ2VyIHRoYW4g
dGhhdCBvZiBkZXZpY2UNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIG1lbW9yeSByZWdpb24uIHFl
bXUgbmVlZHMgdG8gc2F2ZS9sb2FkIGl0IGluIGNodW5rcyBvZiBzaXplDQo+IG9mDQo+ID4gPiA+
ID4gPiA+ID4gICAgICAgICBkZXZpY2UgbWVtb3J5IHJlZ2lvbi4NCj4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgIE5vdCBhbGwgZGV2aWNlIGhhcyBkZXZpY2UgbWVtb3J5LiBMaWtlIElHRCBvbmx5IHVz
ZXMgc3lzdGVtDQo+ID4gPiA+ID4gbWVtb3J5Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
PiBJdCBzZWVtcyBhIGxpdHRsZSBncmF0dWl0b3VzIHRvIG1lIHRoYXQgdGhpcyBpcyBhIHNlcGFy
YXRlIHJlZ2lvbiBvcg0KPiA+ID4gPiA+ID4gPiB0aGF0IHRoaXMgZGF0YSBpcyBoYW5kbGVkIHNl
cGFyYXRlbHkuICBBbGwgb2YgdGhpcyBkYXRhIGlzIG9wYXF1ZSB0bw0KPiA+ID4gPiA+ID4gPiBR
RU1VLCBzbyB3aHkgZG8gd2UgbmVlZCB0byBzZXBhcmF0ZSBpdD8NCj4gPiA+ID4gPiA+IGhpIEFs
ZXgsDQo+ID4gPiA+ID4gPiBhcyB0aGUgZGV2aWNlIHN0YXRlIGludGVyZmFjZXMgYXJlIHByb3Zp
ZGVkIGJ5IGtlcm5lbCwgaXQgaXMgZXhwZWN0ZWQgdG8NCj4gPiA+ID4gPiA+IG1lZXQgYXMgZ2Vu
ZXJhbCBuZWVkcyBhcyBwb3NzaWJsZS4gU28sIGRvIHlvdSB0aGluayB0aGVyZSBhcmUgc3VjaA0K
PiB1c2UNCj4gPiA+ID4gPiA+IGNhc2VzIGZyb20gdXNlciBzcGFjZSB0aGF0IHVzZXIgc3BhY2Ug
a25vd3Mgd2VsbCBvZiB0aGUgZGV2aWNlLCBhbmQNCj4gPiA+ID4gPiA+IGl0IHdhbnRzIGtlcm5l
bCB0byByZXR1cm4gZGVzaXJlZCBkYXRhIGJhY2sgdG8gaXQuDQo+ID4gPiA+ID4gPiBFLmcuIEl0
IGp1c3Qgd2FudHMgdG8gZ2V0IHdob2xlIGRldmljZSBjb25maWcgZGF0YSBpbmNsdWRpbmcgYWxs
IG1taW9zLA0KPiA+ID4gPiA+ID4gcGFnZSB0YWJsZXMsIHBjaSBjb25maWcgZGF0YS4uLg0KPiA+
ID4gPiA+ID4gb3IsIEl0IGp1c3Qgd2FudHMgdG8gZ2V0IGN1cnJlbnQgZGV2aWNlIG1lbW9yeSBz
bmFwc2hvdCwgbm90DQo+IGluY2x1ZGluZyBhbnkNCj4gPiA+ID4gPiA+IGRpcnR5IGRhdGEuDQo+
ID4gPiA+ID4gPiBPciwgSXQganVzdCBuZWVkcyB0aGUgZGlydHkgcGFnZXMgaW4gZGV2aWNlIG1l
bW9yeSBvciBzeXN0ZW0gbWVtb3J5Lg0KPiA+ID4gPiA+ID4gV2l0aCBhbGwgdGhpcyBhY2N1cmF0
ZSBxdWVyeSwgcXVpdGUgYSBsb3Qgb2YgdXNlZnVsIGZlYXR1cmVzIGNhbiBiZQ0KPiA+ID4gPiA+
ID4gZGV2ZWxvcHBlZCBpbiB1c2VyIHNwYWNlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IElm
IGFsbCBvZiB0aGlzIGRhdGEgaXMgb3BhcXVlIHRvIHVzZXIgYXBwLCBzZWVtcyB0aGUgb25seSB1
c2UgY2FzZSBpcw0KPiA+ID4gPiA+ID4gZm9yIGxpdmUgbWlncmF0aW9uLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gSSBjYW4gY2VydGFpbmx5IGFwcHJlY2lhdGUgYSBtb3JlIHZlcnNhdGlsZSBpbnRl
cmZhY2UsIGJ1dCBJIHRoaW5rDQo+ID4gPiA+ID4gd2UncmUgYWxzbyB0cnlpbmcgdG8gY3JlYXRl
IHRoZSBtb3N0IHNpbXBsZSBpbnRlcmZhY2Ugd2UgY2FuLCB3aXRoIHRoZQ0KPiA+ID4gPiA+IHBy
aW1hcnkgdGFyZ2V0IGJlaW5nIGxpdmUgbWlncmF0aW9uLiAgQXMgc29vbiBhcyB3ZSBzdGFydCBk
ZWZpbmluZyB0aGlzDQo+ID4gPiA+ID4gdHlwZSBvZiBkZXZpY2UgbWVtb3J5IGFuZCB0aGF0IHR5
cGUgb2YgZGV2aWNlIG1lbW9yeSwgd2UncmUgZ29pbmcgdG8NCj4gPiA+ID4gPiBoYXZlIGFub3Ro
ZXIgZGV2aWNlIGNvbWUgYWxvbmcgdGhhdCBuZWVkcyB5ZXQgYW5vdGhlciBiZWNhdXNlIHRoZXkN
Cj4gaGF2ZQ0KPiA+ID4gPiA+IGEgc2xpZ2h0bHkgZGlmZmVyZW50IHJlcXVpcmVtZW50LiAgRXZl
biB3aXRob3V0IHRoYXQsIHdlJ3JlIGdvaW5nIHRvDQo+ID4gPiA+ID4gaGF2ZSB2ZW5kb3IgZHJp
dmVycyBpbXBsZW1lbnQgaXQgZGlmZmVyZW50bHksIHNvIHdoYXQgd29ya3MgZm9yIG9uZQ0KPiA+
ID4gPiA+IGRldmljZSBmb3IgYSBtb3JlIHRhcmdldGVkIGFwcHJvYWNoIG1heSBub3Qgd29yayBm
b3IgYWxsIGRldmljZXMuICBDYW4NCj4gPiA+ID4gPiB5b3UgZW51bWVyYXRlIHNvbWUgc3BlY2lm
aWMgZXhhbXBsZXMgb2YgdGhlIHVzZSBjYXNlcyB5b3UgaW1hZ2luZQ0KPiB5b3VyDQo+ID4gPiA+
ID4gZGVzaWduIHRvIGVuYWJsZT8NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBEbyB3ZSB3
YW50IHRvIGNvbnNpZGVyIGFuIHVzZSBjYXNlIHdoZXJlIHVzZXIgc3BhY2Ugd291bGQgbGlrZSB0
bw0KPiA+ID4gPiBzZWxlY3RpdmVseSBpbnRyb3NwZWN0IGEgcG9ydGlvbiBvZiB0aGUgZGV2aWNl
IHN0YXRlIChpbmNsdWRpbmcgaW1wbGljaXQNCj4gPiA+ID4gc3RhdGUgd2hpY2ggYXJlIG5vdCBh
dmFpbGFibGUgdGhyb3VnaCBQQ0kgcmVnaW9ucyksIGFuZCBtYXkgYXNrIGZvcg0KPiA+ID4gPiBj
YXBhYmlsaXR5IG9mIGRpcmVjdCBtYXBwaW5nIG9mIHNlbGVjdGVkIHBvcnRpb24gZm9yIHNjYW5u
aW5nIChlLmcuDQo+ID4gPiA+IGRldmljZSBtZW1vcnkpIGluc3RlYWQgb2YgYWx3YXlzIHR1cm5p
bmcgb24gZGlydHkgbG9nZ2luZyBvbiBhbGwNCj4gPiA+ID4gZGV2aWNlIHN0YXRlPw0KPiA+ID4N
Cj4gPiA+IEkgZG9uJ3Qgc2VlIHRoYXQgYSBtaWdyYXRpb24gaW50ZXJmYWNlIG5lY2Vzc2FyaWx5
IGxlbmRzIGl0c2VsZiB0byB0aGlzDQo+ID4gPiB1c2UgY2FzZS4gIEEgbWlncmF0aW9uIGRhdGEg
c3RyZWFtIGhhcyBubyByZXF1aXJlbWVudCB0byBiZSB1c2VyDQo+ID4gPiBjb25zdW1hYmxlIGFz
IGFueXRoaW5nIG90aGVyIHRoYW4gb3BhcXVlIGRhdGEsIHRoZXJlJ3MgYWxzbyBubw0KPiA+ID4g
cmVxdWlyZW1lbnQgdGhhdCBpdCBleHBvc2Ugc3RhdGUgaW4gYSBmb3JtIHRoYXQgZGlyZWN0bHkg
cmVwcmVzZW50cyB0aGUNCj4gPiA+IGludGVybmFsIHN0YXRlIG9mIHRoZSBkZXZpY2UuICBJbiBm
YWN0IEknbSBub3Qgc3VyZSB3ZSB3YW50IHRvIGVuY291cmFnZQ0KPiA+ID4gaW50cm9zcGVjdGlv
biB2aWEgdGhpcyBkYXRhIHN0cmVhbS4gIElmIGEgdXNlciBrbm93cyBob3cgdG8gaW50ZXJwcmV0
DQo+ID4gPiB0aGUgZGF0YSwgd2hhdCBwcmV2ZW50cyB0aGVtIGZyb20gbW9kaWZ5aW5nIHRoZSBk
YXRhIGluLWZsaWdodD8gIEkndmUNCj4gPiA+IHJhaXNlZCB0aGUgcXVlc3Rpb24gcHJldmlvdXNs
eSByZWdhcmRpbmcgaG93IHRoZSB2ZW5kb3IgZHJpdmVyIGNhbg0KPiA+ID4gdmFsaWRhdGUgdGhl
IGludGVncml0eSBvZiB0aGUgbWlncmF0aW9uIGRhdGEgc3RyZWFtLiAgVXNpbmcgdGhlDQo+ID4g
PiBtaWdyYXRpb24gaW50ZXJmYWNlIHRvIGludHJvc3BlY3QgdGhlIGRldmljZSBjZXJ0YWlubHkg
c3VnZ2VzdHMgYW4NCj4gPiA+IGludGVyZmFjZSByaXBlIGZvciBleHBsb2l0aW5nIGFueSBwb3Rl
bnRpYWwgd2Vha25lc3MgaW4gdGhlIHZlbmRvcg0KPiA+ID4gZHJpdmVyIHJlYXNzZW1ibGluZyB0
aGF0IG1pZ3JhdGlvbiBzdHJlYW0uICBJZiB0aGUgdXNlciBoYXMgYW4gbW1hcCB0bw0KPiA+ID4g
dGhlIGFjdHVhbCBsaXZlIHdvcmtpbmcgc3RhdGUgb2YgdGhlIHZlbmRvciBkcml2ZXIsIHByb3Rl
Y3Rpb24gaW4gdGhlDQo+ID4gPiBoYXJkd2FyZSBzZWVtcyBsaWtlIHRoZSBvbmx5IHdheSB5b3Ug
Y291bGQgcHJvdGVjdCBhZ2FpbnN0IGEgbWFsaWNpb3VzDQo+ID4gPiB1c2VyLiAgUGxlYXNlIGJl
IGRlZmVuc2l2ZSBpbiB3aGF0IGlzIGRpcmVjdGx5IGV4cG9zZWQgdG8gdGhlIHVzZXIgYW5kDQo+
ID4gPiB3aGF0IHNhZmVndWFyZHMgYXJlIGluIHBsYWNlIHdpdGhpbiB0aGUgdmVuZG9yIGRyaXZl
ciBmb3IgdmFsaWRhdGluZw0KPiA+ID4gaW5jb21pbmcgZGF0YS4gIFRoYW5rcywNCj4gPg0KPiA+
IEhtbTsgdGhhdCBzb3VuZHMgbGlrZSBhIHNlY3VyaXR5LWJ5LW9ic2N1cml0eSBhbnN3ZXIhDQo+
IA0KPiBZdXAsIHRoYXQncyBmYWlyLiAgSSB3b24ndCBkZW55IHRoYXQgaW4ta2VybmVsIHZlbmRv
ciBkcml2ZXIgc3RhdGUNCj4gcGFzc2luZyB0aHJvdWdoIHVzZXJzcGFjZSBmcm9tIHNvdXJjZSB0
byB0YXJnZXQgc3lzdGVtcyBzY2FyZXMgbWUgcXVpdGUNCj4gYSBiaXQsIGJ1dCBkZWZpbmluZyBk
ZXZpY2UgaW50cm9zcGVjdGlvbiBhcyBhIHVzZSBjYXNlIGZvciB0aGUNCj4gbWlncmF0aW9uIGlu
dGVyZmFjZSBpbXBvc2VzIHJlcXVpcmVtZW50cyBvbiB0aGUgdmVuZG9yIGRyaXZlcnMgdGhhdA0K
PiBkb24ndCBvdGhlcndpc2UgZXhpc3QuICBNZGV2IHZlbmRvciBzcGVjaWZpYyB1dGlsaXRpZXMg
Y291bGQgYWx3YXlzIGJlDQo+IHdyaXR0ZW4gdG8gaW50ZXJwcmV0IHRoZSBtaWdyYXRpb24gc3Ry
ZWFtIHRvIGRlZHVjZSB0aGUgaW50ZXJuYWwgc3RhdGUsDQo+IGJ1dCBJIHRoaW5rIHRoYXQgaW1w
b3Npbmcgc2VncmVnYXRlZCBkZXZpY2UgbWVtb3J5IHZzIGRldmljZSBjb25maWcNCj4gcmVnaW9u
cyB3aXRoIHRoZSBleHBlY3RhdGlvbiB0aGF0IGludGVybmFsIHN0YXRlIGNhbiBiZSBkaXJlY3Rs
eQ0KPiB0cmFja2VkIGlzIGJleW9uZCB0aGUgc2NvcGUgb2YgYSBtaWdyYXRpb24gaW50ZXJmYWNl
Lg0KDQpJJ20gZmluZSB3aXRoIGRlZmluaW5nIHN1Y2ggaW50ZXJmYWNlIGFpbWVkIG9ubHkgZm9y
IG1pZ3JhdGlvbi1saWtlDQp1c2FnZXMgKGUuZy4gYWxzbyBpbmNsdWRpbmcgZmFzdCBjaGVjay1w
b2ludGluZyksIGJ1dCBJIGRpZG4ndCBidXktaW4NCnRoZSBwb2ludCB0aGF0IHN1Y2ggb3BhcXVl
IHdheSBpcyBtb3JlIHNlY3VyZSB0aGFuIHNlZ3JlZ2F0ZWQNCnN0eWxlIHNpbmNlIHRoZSBsYXlv
dXQgY2FuIGJlIGFueXdheSBkdW1wZWQgb3V0IGJ5IGxvb2tpbmcgYXQgDQpzb3VyY2UgY29kZSBv
ZiBtZGV2IGRyaXZlci4NCg0KQWxzbyBiZXR0ZXIgd2UgZG9uJ3QgaW5jbHVkZSBhbnkgJ21pZ3Jh
dGlvbicgd29yZCBpbiByZWxhdGVkIGludGVyZmFjZQ0Kc3RydWN0dXJlIGRlZmluaXRpb24uIEl0
J3MganVzdCBhbiBvcGFxdWUvZGlydHktbG9nZ2VkIHdheSBvZiBnZXQvc2V0DQpkZXZpY2Ugc3Rh
dGUsIGUuZy4gaW5zdGVhZCBvZiBjYWxsaW5nIGl0ICJtaWdyYXRpb24gaW50ZXJmYWNlIiBjYW4g
d2UNCmNhbGwgaXQgImRpcnR5LWxvZ2dlZCBzdGF0ZSBpbnRlcmZhY2UiPw0KDQo+IA0KPiA+IFRo
ZSBzY3JpcHRzL2FuYWx5emUtbWlncmF0aW9uLnB5IHNjcmlwdHMgd2lsbCBhY3R1YWxseSBkdW1w
IHRoZQ0KPiA+IG1pZ3JhdGlvbiBzdHJlYW0gZGF0YSBpbiBhbiBhbG1vc3QgcmVhZGFibGUgZm9y
bWF0Lg0KPiA+IFNvIGlmIHlvdSBwcm9wZXJseSBkZWZpbmUgdGhlIFZNU3RhdGUgZGVmaW5pdGlv
bnMgaXQgc2hvdWxkIGJlIGFsbW9zdA0KPiA+IHJlYWRhYmxlOyBpdCdzIG9jY2FzaW9uYWxseSBi
ZWVuIHVzZWZ1bC4NCj4gDQo+IFRoYXQncyB0cnVlIGZvciBlbXVsYXRlZCBkZXZpY2VzLCBidXQg
SSBleHBlY3QgYW4gbWRldiBkZXZpY2UgbWlncmF0aW9uDQo+IHN0cmVhbSBpcyBzaW1wbHkgb25l
IGJsb2Igb2Ygb3BhcXVlIGRhdGEgZm9sbG93ZWQgYnkgYW5vdGhlci4gIFdlIGNhbg0KPiBpbXBv
c2UgdGhlIHByb3RvY29sIHRoYXQgdXNlcnNwYWNlIHVzZXMgdG8gcmVhZCBhbmQgd3JpdGUgdGhp
cyBkYXRhDQo+IHN0cmVhbSBmcm9tIHRoZSBkZXZpY2UsIGJ1dCBub3QgdGhlIGRhdGEgaXQgY29u
dGFpbnMuDQo+IA0KPiA+IEkgYWdyZWUgdGhhdCB5b3Ugc2hvdWxkIGJlIHZlcnkgdmVyeSBjYXJl
ZnVsIHRvIHZhbGlkYXRlIHRoZSBpbmNvbWluZw0KPiA+IG1pZ3JhdGlvbiBzdHJlYW0gYWdhaW5z
dDoNCj4gPiAgIGEpIENvcnJ1cHRpb24NCj4gPiAgIGIpIFdyb25nIGRyaXZlciB2ZXJzaW9ucw0K
PiA+ICAgYykgTWFsaWNpb3VzIGludGVudA0KPiA+ICAgICBjLjEpIEVzcGVjaWFsbHkgYnkgdGhl
IGd1ZXN0DQo+ID4gICAgIGMuMikgT3IgYnkgc29tZW9uZSB0cnlpbmcgdG8gZmVlZCB5b3UgYSBk
dWZmIHN0cmVhbQ0KPiA+ICAgZCkgU29tZW9uZSB0cnlpbmcgbG9hZCB0aGUgVkZJTyBzdHJlYW0g
aW50byBjb21wbGV0ZWx5IHRoZSB3cm9uZw0KPiA+IGRldmljZS4NCj4gDQo+IFllcywgYW5kIHdp
dGggb3BlbiBzb3VyY2UgbWRldiB2ZW5kb3IgZHJpdmVycyB3ZSBjYW4gYXQgbGVhc3QNCj4gdGhl
b3JldGljYWxseSBhdWRpdCB0aGUgcmVsb2FkLCBidXQgb2YgY291cnNlIHdlIGFsc28gaGF2ZSBw
cm9wcmlldGFyeQ0KPiBkcml2ZXJzLiAgSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGluc3RhbGwgdGhl
IGtpbGwgc3dpdGNoIGluIGFkdmFuY2UgdG8NCj4gYWxsb3cgdXNlcnMgdG8gb3B0LW91dCBvZiBl
bmFibGluZyBtaWdyYXRpb24gYXQgdGhlIG1kZXYgbGF5ZXIuDQo+IA0KPiA+IFdoZXRoZXIgdGhl
IG1pZ3JhdGlvbiBpbnRlcmZhY2UgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIHVzZSBmb3IgdGhhdA0K
PiA+IGluc3BlY3Rpb24gaG1tOyB3ZWxsIGl0IG1pZ2h0IGJlIC0gaWYgeW91J3JlIHRyeWluZyB0
byBkZWJ1Zw0KPiA+IHlvdXIgZGV2aWNlIGFuZCBuZWVkIGEgZHVtcCBvZiBpdCdzIHN0YXRlLCB0
aGVuIHdoeSBub3Q/DQo+ID4gKEkgZ3Vlc3MgeW91IGVuZCB1cCB3aXRoIHNvbWV0aGluZyBub3Qg
ZGlzc2ltaWxhciB0byB3aGF0IHRoaW5ncw0KPiA+IGxpa2UgaW50ZWtfcmVnX3NuYXBzaG90IGlu
IGludGVsLWdwdS10b29scyBkb2VzKS4NCj4gDQo+IFN1cmUsIGFzIGFib3ZlIHRoZXJlJ3Mgbm90
aGluZyBwcmV2ZW50aW5nIG1kZXYgc3BlY2lmaWMgdXRpbGl0aWVzIGZyb20NCj4gZGVjb2Rpbmcg
dGhlIG1pZ3JhdGlvbiBzdHJlYW0sIGJ1dCBJIGJlZ2luIHRvIGhhdmUgYW4gaXNzdWUgaWYgdGhp
cw0KPiBpbnRyb3NwZWN0aXZlIHVzZSBjYXNlIGltcG9zZXMgcmVxdWlyZW1lbnRzIG9uIGhvdyBk
ZXZpY2Ugc3RhdGUgaXMNCj4gcmVwcmVzZW50ZWQgdGhyb3VnaCB0aGUgbWlncmF0aW9uIGludGVy
ZmFjZSB0aGF0IGRvbid0IG90aGVyd2lzZQ0KPiBleGlzdC4gIElmIHdlIHdhbnQgdG8gZGVmaW5l
IGEgc3RhbmRhcmQgZm9yIHRoZSBhY3R1YWwgZGF0YSBmcm9tIHRoZQ0KPiBkZXZpY2UsIHdlJ2xs
IGJlIGF0IHRoaXMgZm9yIHllYXJzIDotXCAgVGhhbmtzLA0KPiANCg0KSW50cm9zcGVjdGlvbiBp
cyBvbmUgcG90ZW50aWFsIHVzYWdlIHdoZW4gdGhpbmtpbmcgYWJvdXQgbW1hcHBlZA0Kc3R5bGUg
aW4gWWFuJ3MgcHJvcG9zYWwsIGJ1dCBpdCdzIG5vdCBzdHJvbmcgZW5vdWdoIHNpbmNlIGludHJv
c3BlY3Rpb24NCmNhbiBiZSBhbHNvIGRvbmUgd2l0aCBvcGFxdWUgd2F5IChqdXN0IG5vdCBvcHRp
bWFsIG1lYW5pbmcgYWx3YXlzDQpuZWVkIHRvIHRyYWNrIGFsbCB0aGUgc3RhdGVzKS4gV2UgbWF5
IGludHJvZHVjZSBuZXcgaW50ZXJmYWNlIGluIHRoZQ0KZnV0dXJlIHdoZW4gaXQgYmVjb21lcyBh
IHJlYWwgcHJvYmxlbS4NCg0KQnV0IEkgc3RpbGwgZGlkbid0IGdldCB5b3VyIGV4YWN0IGNvbmNl
cm4gYWJvdXQgc2VjdXJpdHkgcGFydC4gRm9yDQp2ZXJzaW9uIHllcyB3ZSBzdGlsbCBoYXZlbid0
IHdvcmtlZCBvdXQgYSBzYW5lIHdheSB0byByZXByZXNlbnQNCnZlbmRvci1zcGVjaWZpYyBjb21w
YXRpYmlsaXR5IHJlcXVpcmVtZW50LiBCdXQgYWxsb3dpbmcgdXNlcg0Kc3BhY2UgdG8gbW9kaWZ5
IGRhdGEgdGhyb3VnaCB0aGlzIGludGVyZmFjZSBoYXMgcmVhbGx5IG5vIGRpZmZlcmVuY2UNCmZy
b20gYWxsb3dpbmcgZ3Vlc3QgdG8gbW9kaWZ5IGRhdGEgdGhyb3VnaCB0cmFwcGVkIE1NSU8gaW50
ZXJmYWNlLg0KbWRldiBkcml2ZXIgc2hvdWxkIGd1YXJhbnRlZSB0aGF0IG9wZXJhdGlvbnMgdGhy
b3VnaCBib3RoIGludGVyZmFjZXMNCmNhbiBtb2RpZnkgb25seSB0aGUgc3RhdGUgYXNzb2NpYXRl
ZCB3aXRoIHRoZSBzYWlkIG1kZXYgaW5zdGFuY2UsDQp3L28gYnJlYWtpbmcgdGhlIGlzb2xhdGlv
biBib3VuZGFyeS4gVGhlbiB0aGUgZm9ybWVyIGJlY29tZXMganVzdA0KYSBiYXRjaCBvZiBvcGVy
YXRpb25zIHRvIGJlIHZlcmlmaWVkIGluIHRoZSBzYW1lIHdheSBhcyBpZiB0aGV5IGFyZQ0KZG9u
ZSBpbmRpdmlkdWFsbHkgdGhyb3VnaCB0aGUgbGF0dGVyIGludGVyZmFjZS4gDQoNClRoYW5rcw0K
S2V2aW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlu
dGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwt
Z3Z0LWRldg==
