Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp2061732ywb;
        Mon, 11 Mar 2019 19:48:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0U4/ZL1ZyYhZVrZ/h9KDaHa7sId328ynJgCSAyE7p/D4yOUNRwTjWkSf3KRN6fw9Nmd7h
X-Received: by 2002:aa7:8c4d:: with SMTP id e13mr36505548pfd.53.1552358925153;
        Mon, 11 Mar 2019 19:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552358925; cv=none;
        d=google.com; s=arc-20160816;
        b=HxETrwjygZHeaYHQ3IilPb051aylUGwK+in2QpIh37g7sN2zl2WgiAeUyuBBLKRNiZ
         Wjg2E366pZbpmb99+L0aYV2zItTSVx/Z1tGzBrMe1HEJWNf5AyzGcHYjODUWo2Z2ojba
         u/EsT1OdZOmKCe4BuWO75/+XGMrEJnbn1vk8qTM2DVaFkqYxxsJ4p1/p1K7oi8PCm7kp
         tlUjxj3MpSDW2b+ILx2vGaag81ZXhfI01cNULT+s1vwG9erniu0kOL7W9V3KS3xPMfva
         dTvDzRzDJZr2rBbTNTGW5dnXmOpP6ZGhDlLc/qLjDyhp13ZJN6mI5TsLxVTVnCwyU/LT
         +DkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=7EtnGIePpGV5fHF404BawdlQHl09M4pU/JtpZZVfmB4=;
        b=runq9vC/n/GENLnkl+ZGtqzkd0OxX+EEZSnqjToieeXkjW4oObE7oMIaz08h6+Oi76
         WjEqUKaekCAgc+ux711ay0kgt2HrB3kI1rbctZpSTb3X95ktrMtJdJPvMrtt8aslE7RM
         8k1DuevOsbOFixZXwToT8LycbYQFag0U29/k+NJwUlNKyZCzC5+QsSB0ITLmH0PkGQv1
         QkrJ9AWfn/ETikBhb7ZitdojzADd9DcxiSQ8EqIDyopOQqMzWTO9QsPDxQI4AR40Zt7e
         B99c3vcW750ncLqDZfyMmuDJ6Pjq7vZ8/wABHoAQ/7gpb/i5JXmCiavTZ/j5DULkekvm
         pt1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d36si3655986pla.425.2019.03.11.19.48.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2019 19:48:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDAA89D77;
	Tue, 12 Mar 2019 02:48:44 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C8D89D77
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 12 Mar 2019 02:48:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2019 19:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,469,1544515200"; d="scan'208";a="130828672"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2019 19:48:42 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Mar 2019 19:48:42 -0700
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Mar 2019 19:48:41 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.74]) by
 SHSMSX103.ccr.corp.intel.com ([169.254.4.134]) with mapi id 14.03.0415.000;
 Tue, 12 Mar 2019 10:48:40 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBZ+rAJaWhuwUultlHIVQiP6qXqNPqAgAUWkgCAELjBgIAA31UQgACZEoCAAALbAIAAX1AAgAPuAMCAAKwNgIAA5z4A
Date: Tue, 12 Mar 2019 02:48:39 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C985486@SHSMSX104.ccr.corp.intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
 <20190308091133.3073f5db@x1.home>	<20190308162146.GD2834@work-vm>
 <20190308150254.3d1af7d8@x1.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C983C63@SHSMSX104.ccr.corp.intel.com>
 <20190311141919.0c675efc@x1.home>
In-Reply-To: <20190311141919.0c675efc@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjNiNjYwMmYtZmU4Yy00YzU5LTgwOTAtMmU3MDEyNTYzOGJiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTlpmMzRpRFAwOFwvSzRBR092cWM0QWhMNzlhOVJZTUIyYTByZmViQk1EdnpTZ0wyMGhRZFwvWUx4ckVFTjUydmVQIn0=
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gW21haWx0bzphbGV4LndpbGxpYW1zb25AcmVkaGF0LmNv
bV0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxMiwgMjAxOSA0OjE5IEFNCj4gT24gTW9uLCAxMSBN
YXIgMjAxOSAwMjozMzoxMSArMDAwMAo+ICJUaWFuLCBLZXZpbiIgPGtldmluLnRpYW5AaW50ZWwu
Y29tPiB3cm90ZToKPiAKWy4uLl0KPiAKPiBJIHRoaW5rIEkndmUgZnVsbHkgY29uY2VkZWQgYW55
IG5vdGlvbiBvZiBzZWN1cml0eSBieSBvYnNjdXJpdHkgdG93YXJkcwo+IG9wYXF1ZSBkYXRhIGFs
cmVhZHksIGJ1dCBzZWdyZWdhdGluZyB0eXBlcyBvZiBkZXZpY2UgZGF0YSBzdGlsbCBzZWVtcwo+
IHRvIHVubmVjZXNzYXJpbHkgaW1wb3NlIGEgdXNhZ2UgbW9kZWwgb24gdGhlIHZlbmRvciBkcml2
ZXIgdGhhdCBJIHRoaW5rCj4gd2Ugc2hvdWxkIHRyeSB0byBhdm9pZC4gIFRoZSBtaWdyYXRpb24g
aW50ZXJmYWNlIHNob3VsZCBkZWZpbmUgdGhlCj4gcHJvdG9jb2wgdGhyb3VnaCB3aGljaCB1c2Vy
c3BhY2UgY2FuIHNhdmUgYW5kIHJlc3RvcmUgdGhlIGRldmljZSBzdGF0ZSwKPiBub3QgaW1wb3Nl
IGhvdyB0aGUgdmVuZG9yIGRyaXZlciBleHBvc2VzIG9yIG1hbmFnZXMgdGhhdCBzdGF0ZS4gIEFs
c28sIEkKPiBnb3QgdGhlIGltcHJlc3Npb24gKHBlcmhhcHMgaW5jb3JyZWN0bHkpIHRoYXQgeW91
IHdlcmUgdHJ5aW5nIHRvIG1tYXAKPiBsaXZlIGRhdGEgdG8gdXNlcnNwYWNlLCB3aGljaCB3b3Vs
ZCBhbGxvdyBub3Qgb25seSBzYXZpbmcgdGhlIHN0YXRlLAo+IGJ1dCBhbHNvIHVuY2hlY2tlZCBz
dGF0ZSBtb2RpZmljYXRpb24gYnkgdXNlcnNwYWNlLiBJIHRoaW5rIHdlIHdhbnQKPiBtb3JlIG9m
IGEgcHJvZHVjZXIvY29uc3VtZXIgbW9kZWwgb2YgdGhlIHN0YXRlIHdoZXJlIGNvbnN1bWluZyBz
dGF0ZQo+IGFsc28gaW52b2x2ZXMgYXQgbGVhc3Qgc29tZSBkZWdyZWUgb2Ygc2FuaXR5IG9yIGNv
bnNpc3RlbmN5IGNoZWNraW5nLgo+IExldCdzIG5vdCBmb3JnZXQgdG9vIHRoYXQgd2UncmUgb2J2
aW91c2x5IGRlYWxpbmcgd2l0aCBub24tb3BlbiBzb3VyY2UKPiBkcml2ZXIgaW4gdGhlIG1kZXYg
dW5pdmVyc2UgYXMgd2VsbC4KCk9LLiBJIHRoaW5rIGZvciB0aGlzIHBhcnQgd2UgYXJlIGluIGFn
cmVlbWVudCAtIGFzIGxvbmcgYXMgdGhlIGdvYWwgb2YKdGhpcyBpbnRlcmZhY2UgaXMgY2xlYXJs
eSBkZWZpbmVkIGFzIHN1Y2ggd2F5LiA6LSkKClsuLi5dCj4gPiBCdXQgSSBzdGlsbCBkaWRuJ3Qg
Z2V0IHlvdXIgZXhhY3QgY29uY2VybiBhYm91dCBzZWN1cml0eSBwYXJ0LiBGb3IKPiA+IHZlcnNp
b24geWVzIHdlIHN0aWxsIGhhdmVuJ3Qgd29ya2VkIG91dCBhIHNhbmUgd2F5IHRvIHJlcHJlc2Vu
dAo+ID4gdmVuZG9yLXNwZWNpZmljIGNvbXBhdGliaWxpdHkgcmVxdWlyZW1lbnQuIEJ1dCBhbGxv
d2luZyB1c2VyCj4gPiBzcGFjZSB0byBtb2RpZnkgZGF0YSB0aHJvdWdoIHRoaXMgaW50ZXJmYWNl
IGhhcyByZWFsbHkgbm8gZGlmZmVyZW5jZQo+ID4gZnJvbSBhbGxvd2luZyBndWVzdCB0byBtb2Rp
ZnkgZGF0YSB0aHJvdWdoIHRyYXBwZWQgTU1JTyBpbnRlcmZhY2UuCj4gPiBtZGV2IGRyaXZlciBz
aG91bGQgZ3VhcmFudGVlIHRoYXQgb3BlcmF0aW9ucyB0aHJvdWdoIGJvdGggaW50ZXJmYWNlcwo+
ID4gY2FuIG1vZGlmeSBvbmx5IHRoZSBzdGF0ZSBhc3NvY2lhdGVkIHdpdGggdGhlIHNhaWQgbWRl
diBpbnN0YW5jZSwKPiA+IHcvbyBicmVha2luZyB0aGUgaXNvbGF0aW9uIGJvdW5kYXJ5LiBUaGVu
IHRoZSBmb3JtZXIgYmVjb21lcyBqdXN0Cj4gPiBhIGJhdGNoIG9mIG9wZXJhdGlvbnMgdG8gYmUg
dmVyaWZpZWQgaW4gdGhlIHNhbWUgd2F5IGFzIGlmIHRoZXkgYXJlCj4gPiBkb25lIGluZGl2aWR1
YWxseSB0aHJvdWdoIHRoZSBsYXR0ZXIgaW50ZXJmYWNlLgo+IAo+IEl0IHNlZW1zIGxpa2UgeW91
J3JlIGFzc3VtaW5nIGEgd29ya2luZyBtb2RlbCBmb3IgdGhlIHZlbmRvciBkcml2ZXIgYW5kCj4g
dGhlIGRhdGEgZW50ZXJpbmcgYW5kIGV4aXRpbmcgdGhyb3VnaCB0aGlzIGludGVyZmFjZS4gIFRo
ZSB2ZW5kb3IKPiBkcml2ZXJzIGNhbiBleHBvc2UgZGF0YSBhbnkgd2F5IHRoYXQgdGhleSB3YW50
LiAgQWxsIHdlIG5lZWQgdG8gZG8gaXMKPiBpbWFnaW5lIHRoYXQgdGhlIG1pZ3JhdGlvbiBkYXRh
IHN0cmVhbSBpbmNsdWRlcyBhbiBhcnJheSBpbmRleCBjb3VudAo+IHNvbWV3aGVyZSB3aGljaCB0
aGUgdXNlciBjb3VsZCBtb2RpZnkgdG8gdHJpZ2dlciB0aGUgaW4ta2VybmVsIHZlbmRvcgo+IGRy
aXZlciB0byBhbGxvY2F0ZSBhbiBhYnN1cmQgYXJyYXkgc2l6ZSBhbmQgRG9TIHRoZSB0YXJnZXQu
ICBUaGlzIGlzCj4gcHJvYmFibHkgdGhlIG1vc3Qgc2ltcGxpc3RpYyBhdHRhY2ssIHBvc3NpYmx5
IGtub3dpbmcgdGhlIHN0YXRlIG1hY2hpbmUKPiBvZiB0aGUgdmVuZG9yIGRyaXZlciBhIG1hbGlj
aW91cyB1c2VyIGNvdWxkIHRyaWNrIGl0IGludG8gcHJvdmlkaW5nCj4gaG9zdCBrZXJuZWwgZGF0
YS4gIFdlJ3JlIG5vdCBuZWNlc3NhcmlseSBvbmx5IGNvbnZleWluZyBzdGF0ZSB0aGF0IHRoZQo+
IHVzZXIgYWxyZWFkeSBoYXMgYWNjZXNzIHRvIHZpYSB0aGlzIGludGVyZmFjZSwgdGhlIHZlbmRv
ciBkcml2ZXIgbWF5Cj4gaW5jbHVkZSBub24tdmlzaWJsZSBpbnRlcm5hbCBzdGF0ZSBhcyB3ZWxs
LiAgRXZlbiB0aGUgc3RhdGUgdGhhdCBpcwo+IHVzZXIgYWNjZXNzaWJsZSBpcyBiZWluZyBwdXNo
ZWQgaW50byB0aGUgdmVuZG9yIGRyaXZlciB2aWEgYW4gYWx0ZXJuYXRlCj4gcGF0aCBmcm9tIHRo
ZSB1c2VyIG1lZGlhdGlvbiB3ZSBoYXZlIG9uIHRoZSBleGlzdGluZyBwYXRocy4KClRoZW4gSSBk
b24ndCBrbm93IGhvdyB0aGlzIGNvbmNlcm4gY2FuIGJlIGVmZmVjdGl2ZWx5IGFkZHJlc3NlZCAK
c2luY2UgeW91IGFzc3VtZSB2ZW5kb3IgZHJpdmVycyBhcmUgbm90IHRydXN0ZWQgaGVyZS4gYW5k
IHdoeSBkbwp5b3UgdHJ1c3QgdmVuZG9yIGRyaXZlcnMgb24gbWVkaWF0aW5nIGV4aXN0aW5nIHBh
dGggYnV0IG5vdCB0aGlzCmFsdGVybmF0aXZlIG9uZT8gbm9uLXZpc2libGUgaW50ZXJuYWwgc3Rh
dGVzIGp1c3QgbWVhbiBtb3JlIHN0dWZmCnRvIGJlIGNhcmVmdWxseSBzY3J1dGluaXplZCwgd2hp
Y2ggaXMgbm90IGVzc2VudGlhbGx5IGNhdXNpbmcgYSAKY29uY2VwdHVhbCBkaWZmZXJlbmNlIG9m
IHRydXN0IGxldmVsLgoKT3IgY2FuIHRoaXMgY29uY2VybiBiZSBwYXJ0aWFsbHkgbWl0aWdhdGVk
IGlmIHdlIGNyZWF0ZSBzb21lIAp0ZXN0IGNhc2VzIHdoaWNoIHBva2UgcmFuZG9tIGRhdGEgdGhy
b3VnaCB0aGUgbmV3IGludGVyZmFjZSwKYW5kIG1hcmsgdmVuZG9yIGRyaXZlcnMgd2hpY2ggcGFz
cyBzdWNoIHRlc3RzIGFzIHRydXN0ZWQ/IFRoZW4KdGhlcmUgaXMgYWxzbyBhbiBvcGVuIHdobyBz
aG91bGQgYmUgaW4gY2hhcmdlIG9mIHN1Y2ggY2VydGlmaWNhdGlvbiAKcHJvY2Vzcy4uLgoKVGhh
bmtzCktldmluCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
