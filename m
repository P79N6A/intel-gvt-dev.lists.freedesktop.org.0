Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3059035ywo;
        Mon, 22 Apr 2019 22:47:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy3oGvzQpXwxdI8xgi3hzELMq1el5uI41P8/uwDw4nivEcHiLjLf+DNS+tSDPRwQIzGhG2O
X-Received: by 2002:a62:6c6:: with SMTP id 189mr24607634pfg.36.1555998457618;
        Mon, 22 Apr 2019 22:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555998457; cv=none;
        d=google.com; s=arc-20160816;
        b=qB3WsxHdAMU0R6/96wBB2of0tPOrDHnS6MxINbIMs6iaEt2wRpbAOsVFZ+8HAet6jR
         Ujp4ur1T1DFyuEePx+6IhvINCBIHj6/D8vpPLtTe1BF+pmABDdqUngHsR/hYroc8Ppdq
         hAArFGObAS1F9siY8FEywtfDJpG7Zkio/v2PAUYlm1J7eKNwGrTvHGWEjuQPQKTgDa/I
         p1yfc7o59X+Wf6rNQYbsG2/UcB4+poj+T0KBAMNkCS4Nlu94Wk8tJTepeEoyR7BBnM9y
         g8yUuY6fpKQOnCreiBtNhep8lfFpzpCY/pXfj0QR2RJROkPfTjs/qtRkEJ+ceQVYfg/R
         Sajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=SQ7IQUKx5QW5lJWy25iFhqeWLzlmIjyXyUe9z6hPlXQ=;
        b=kqHycGicHIGrv8u+z+gVKkMZ8/3mH1ZtOUpefeo4b1MpcY3a6pQJ3xK5WiXx+BUJiJ
         o/pF6CQWwzz3MBwulnQV3tAw5BVlKtx8IhCoGFJmZjrP+rrGh7zlLdPLiZaVTOioxlH1
         ACDxPpgjldPVakhUs+F7W+Opt4F6o+w5u08RrzbaQNnH80loVR7VUPoKs8e6slz+g5lC
         Z2mPjaMLCUbpI9Zv4+02S0uqfr5Wwc2N508EE7jGscFa+1LYRLkkS4HVmeB41i1KSOsl
         GKXA4MTed1fi28kyqDD57lSND4Frpea/+3PH0WVdupfdouJHe/ok7hxBOyqPi4y5tgCg
         KI1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id a62si12243706pla.107.2019.04.22.22.47.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2019 22:47:37 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE28932B;
	Tue, 23 Apr 2019 05:47:36 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61A68932B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 05:47:34 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Apr 2019 22:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,384,1549958400"; d="scan'208";a="142801179"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2019 22:47:29 -0700
Date: Tue, 23 Apr 2019 01:41:57 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 1/2] vfio/mdev: add version field as mandatory attribute
 for mdev device
Message-ID: <20190423054157.GA26190@joy-OptiPlex-7040>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190422083950.25eb9e7c@x1.home>
 <20190423010152.GC32217@joy-OptiPlex-7040>
 <20190422192100.4d577e4b@x1.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190422192100.4d577e4b@x1.home>
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDk6MjE6MDBBTSArMDgwMCwgQWxleCBXaWxsaWFtc29u
IHdyb3RlOgo+IE9uIE1vbiwgMjIgQXByIDIwMTkgMjE6MDE6NTIgLTA0MDAKPiBZYW4gWmhhbyA8
eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+IAo+ID4gT24gTW9uLCBBcHIgMjIsIDIwMTkg
YXQgMTA6Mzk6NTBQTSArMDgwMCwgQWxleCBXaWxsaWFtc29uIHdyb3RlOgo+ID4gPiBPbiBGcmks
IDE5IEFwciAyMDE5IDA0OjM1OjA0IC0wNDAwCj4gPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGlu
dGVsLmNvbT4gd3JvdGU6Cj4gPiA+ICAgCj4gPiA+ID4gZGV2aWNlIHZlcnNpb24gYXR0cmlidXRl
IGluIG1kZXYgc3lzZnMgaXMgdXNlZCBieSB1c2VyIHNwYWNlIHNvZnR3YXJlCj4gPiA+ID4gKGUu
Zy4gbGlidmlydCkgdG8gcXVlcnkgZGV2aWNlIGNvbXBhdGliaWxpdHkgZm9yIGxpdmUgbWlncmF0
aW9uIG9mIFZGSU8KPiA+ID4gPiBtZGV2IGRldmljZXMuIFRoaXMgYXR0cmlidXRlIGlzIG1hbmRh
dG9yeSBpZiBhIG1kZXYgZGV2aWNlIHN1cHBvcnRzIGxpdmUKPiA+ID4gPiBtaWdyYXRpb24uICAK
PiA+ID4gCj4gPiA+IFRoZSBTdWJqZWN0OiBkb2Vzbid0IHF1aXRlIG1hdGNoIHdoYXQncyBiZWlu
ZyBwcm9wb3NlZCBoZXJlLgo+ID4gPiAgICAKPiA+ID4gPiBJdCBjb25zaXN0cyBvZiB0d28gcGFy
dHM6IGNvbW1vbiBwYXJ0IGFuZCB2ZW5kb3IgcHJvcHJpZXRhcnkgcGFydC4KPiA+ID4gPiBjb21t
b24gcGFydDogMzIgYml0LiBsb3dlciAxNiBiaXRzIGlzIHZlbmRvciBpZCBhbmQgaGlnaGVyIDE2
IGJpdHMKPiA+ID4gPiAgICAgICAgICAgICAgaWRlbnRpZmllcyBkZXZpY2UgdHlwZS4gZS5nLiwg
Zm9yIHBjaSBkZXZpY2UsIGl0IGlzCj4gPiA+ID4gICAgICAgICAgICAgICJwY2kgdmVuZG9yIGlk
IiB8IChWRklPX0RFVklDRV9GTEFHU19QQ0kgPDwgMTYpLiAgCj4gPiA+IAo+ID4gPiBXaGF0IHB1
cnBvc2UgZG9lcyB0aGlzIHNlcnZlPyAgSWYgaXQncyBpbnRlbmRlZCBhcyBzb21lIHNvcnQgb2YK
PiA+ID4gbmFtZXNwYWNlIGZlYXR1cmUsIHNob3VsZG4ndCB3ZSBmaXJzdCBhc3N1bWUgdGhhdCB3
ZSBjYW4gb25seSBzdXBwb3J0Cj4gPiA+IG1pZ3JhdGlvbiB0byBkZXZpY2VzIG9mIHRoZSBzYW1l
IHR5cGU/ICBUaGVyZWZvcmUgZWFjaCB0eXBlIHdvdWxkCj4gPiA+IGFscmVhZHkgaGF2ZSBpdHMg
b3duIG5hbWVzcGFjZS4gIEFsc28gdGhhdCB3b3VsZCBtYWtlIHRoZSB0cmFpbGluZyBiaXQKPiA+
ID4gb2YgdGhlIHZlcnNpb24gc3RyaW5nIGxpc3RlZCBiZWxvdyBpbiB0aGUgZXhhbXBsZSByZWR1
bmRhbnQuICBBIHZlbmRvcgo+ID4gPiBpcyBzdGlsbCB3ZWxjb21lIHRvIGluY2x1ZGUgdGhpcyBp
biB0aGVpciB2ZXJzaW9uIHN0cmluZyBpZiB0aGV5IHdpc2gsCj4gPiA+IGJ1dCBJIHRoaW5rIHRo
ZSBzdHJpbmcgc2hvdWxkIGJlIGVudGlyZWx5IHZlbmRvciBkZWZpbmVkLgo+ID4gPiAgCj4gPiBo
aSBBbGV4LAo+ID4gVGhpcyBjb21tb24gcGFydCBpcyBhIGtpbmQgb2YgbmFtZXNwYWNlLgo+ID4g
QmVjYXVzZSBpZiB2ZXJzaW9uIHN0cmluZyBpcyBlbnRpcmVseSBkZWZpbmVkIGJ5IHZlbmRvcnMs
IEknbSB3b3JyaWVkIGFib3V0Cj4gPiBpZiB0aGVyZSBpcyBhIGNhc2UgdGhhdCBvbmUgdmVuZG9y
J3MgdmVyc2lvbiBzdHJpbmcgaGFwcGVucyB0byBkZWNlaXZlIGFuZAo+ID4gaW50ZXJmZXJlIHdp
dGggYW5vdGhlciB2ZW5kb3IncyB2ZXJzaW9uIGNoZWNraW5nPwo+ID4gZS5nLgo+ID4gdmVuZG9y
IEEgaGFzIGEgdmVyc2lvbiBzdHJpbmcgbGlrZTogdmVuZG9yIGlkICsgZGV2aWNlIGlkICsgbWRl
diB0eXBlCj4gPiB2ZW5kb3IgQiBoYXMgYSB2ZXJzaW9uIHN0cmluZyBsaWtlOiBkZXZpY2UgaWQg
KyB2ZW5kb3IgaWQgKyBtZGV2IHR5cGUKPiA+IGJ1dCB2ZW5kb3IgQSdzIHZlbmRvciBpZCBpcyAw
eDgwODYsIGRldmljZSBpZCBpcyAweDEyMTcKPiA+IHZlbmRvciBCJ3MgdmVuZG9yIGlkIGlzIDB4
MTIxNywgZGV2aWNlIGlkIGlzIDB4ODA4Ni4KPiA+IAo+ID4gSW4gdGhpcyBjb3JuZXIgY2FzZSwg
dGhlIHR3byB2ZW5kb3JzIG1heSByZWdhcmQgdGhlIHR3byBkZXZpY2UgaXMKPiA+IG1pZ3JhdGFi
bGUgYnV0IGFjdHVhbGx5IHRoZXkgYXJlIG5vdC4KPiA+IAo+ID4gVGhhdCdzIHRoZSByZWFzb24g
Zm9yIHRoaXMgY29tbW9uIHBhcnQgdGhhdCBzZXJ2ZSBhcyBhIGtpbmQgb2YgbmFtZXNwYWNlCj4g
PiB0aGF0IGFsbCB2ZW5kb3JzIHdpbGwgY29tcGx5IHdpdGggdG8gYXZvaWQgb3ZlcmxhcC4KPiAK
PiBJZiB3ZSBhc3N1bWUgdGhhdCBtaWdyYXRpb24gY2FuIG9ubHkgb2NjdXIgYmV0d2VlbiBtYXRj
aGluZyBtZGV2IHR5cGVzLAo+IHRoaXMgaXMgcmVkdW5kYW50LCBlYWNoIHR5cGUgYWxyZWFkeSBo
YXMgdGhlaXIgb3duIG5hbWVzcGFjZS4KPgpoaSBBbGV4LApkbyB5b3UgbWVhbiB1c2VyIHNwYWNl
IHNvZnR3YXJlIGxpa2UgbGlidmlydCBuZWVkcyB0byBmaXJzdCBjaGVjayB3aGV0aGVyCm1kZXYg
dHlwZSBpcyBtYXRjaGluZyBhbmQgdGhlbiBjaGVjayB3aGV0aGVyIHZlcnNpb24gaXMgbWF0Y2hp
bmc/CgppZiB1c2VyIHNwYWNlIHNvZnR3YXJlIG9ubHkgY2hlY2tzIHZlcnNpb24gZm9yIG1pZ3Jh
dGlvbiwgaXQgbWVhbnMgdmVuZG9yCmRyaXZlciBoYXMgdG8gaW5jbHVkZSBtZGV2IHR5cGUgaW4g
dGhlaXIgdmVuZG9yIHByb3ByaWV0YXJ5IHBhcnQgc3RyaW5nLApyaWdodD8KCkFub3RoZXIgdGhp
bmcgaXMgdGhhdCBjb3VsZCB0aGVyZSBiZSBhbnkgZnV0dXJlIG1kZXYgcGFyZW50IGRyaXZlciB0
aGF0CmFwcGxpZXMgdG8gYWxsIG1kZXYgZGV2aWNlcywganVzdCBsaWtlIHZmaW8tcGNpPyBsaWtl
IFlpJ3MgdmZpby1wY2ktbWRldgpkcml2ZXIgKGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzMv
MTMvMTE0KT8KCj4gPiA+ID4gdmVuZG9yIHByb3ByaWV0YXJ5IHBhcnQ6IHRoaXMgcGFydCBpcyB2
YXJpZWQgaW4gbGVuZ3RoLiB2ZW5kb3IgZHJpdmVyIGNhbgo+ID4gPiA+ICAgICAgICAgICAgICBz
cGVjaWZ5IGFueSBzdHJpbmcgdG8gaWRlbnRpZnkgYSBkZXZpY2UuCj4gPiA+ID4gCj4gPiA+ID4g
V2hlbiByZWFkaW5nIHRoaXMgYXR0cmlidXRlLCBpdCBzaG91bGQgc2hvdyBkZXZpY2UgdmVyc2lv
biBzdHJpbmcgb2YgdGhlCj4gPiA+ID4gZGV2aWNlIG9mIHR5cGUgPHR5cGUtaWQ+LiBJZiBhIGRl
dmljZSBkb2VzIG5vdCBzdXBwb3J0IGxpdmUgbWlncmF0aW9uLCBpdAo+ID4gPiA+IHNob3VsZCBy
ZXR1cm4gZXJybm8uCj4gPiA+ID4gV2hlbiB3cml0aW5nIGEgc3RyaW5nIHRvIHRoaXMgYXR0cmli
dXRlLCBpdCByZXR1cm5zIGVycm5vIGZvcgo+ID4gPiA+IGluY29tcGF0aWJpbGl0eSBvciByZXR1
cm5zIHdyaXR0ZW4gc3RyaW5nIGxlbmd0aCBpbiBjb21wYXRpYmlsaXR5IGNhc2UuCj4gPiA+ID4g
SWYgYSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBsaXZlIG1pZ3JhdGlvbiwgaXQgYWx3YXlzIHJl
dHVybnMgZXJybm8uCj4gPiA+ID4gCj4gPiA+ID4gRm9yIHVzZXIgc3BhY2Ugc29mdHdhcmUgdG8g
dXNlOgo+ID4gPiA+IDEuCj4gPiA+ID4gQmVmb3JlIHN0YXJ0aW5nIGxpdmUgbWlncmF0aW9uLCB1
c2VyIHNwYWNlIHNvZnR3YXJlIGZpcnN0IHJlYWRzIHNvdXJjZSBzaWRlCj4gPiA+ID4gbWRldiBk
ZXZpY2UncyB2ZXJzaW9uLiBlLmcuCj4gPiA+ID4gIiNjYXQgXAo+ID4gPiA+IC9zeXMvYnVzL3Bj
aS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wLzVhYzFmYjIwLTJiYmYtNDg0Mi1iYjdlLTM2YzU4YzNi
ZTljZC9tZGV2X3R5cGUvdmVyc2lvbiIKPiA+ID4gPiAwMDAyODA4Ni0xOTNiLWk5MTUtR1ZUZ19W
NV80Cj4gPiA+ID4gCj4gPiA+ID4gMi4KPiA+ID4gPiBUaGVuLCB1c2VyIHNwYWNlIHNvZnR3YXJl
IHdyaXRlcyB0aGUgc291cmNlIHNpZGUgcmV0dXJuZWQgdmVyc2lvbiBzdHJpbmcKPiA+ID4gPiB0
byBkZXZpY2UgdmVyc2lvbiBhdHRyaWJ1dGUgaW4gdGFyZ2V0IHNpZGUsIGFuZCBjaGVja3MgdGhl
IHJldHVybiB2YWx1ZS4KPiA+ID4gPiBJZiBhIG5lZ2F0aXZlIGVycm5vIGlzIHJldHVybmVkIGlu
IHRoZSB0YXJnZXQgc2lkZSwgdGhlbiBtZGV2IGRldmljZXMgaW4KPiA+ID4gPiBzb3VyY2UgYW5k
IHRhcmdldCBzaWRlcyBhcmUgbm90IGNvbXBhdGlibGU7Cj4gPiA+ID4gSWYgYSBwb3NpdGl2ZSBu
dW1iZXIgaXMgcmV0dXJuZWQgYW5kIGl0IGVxdWFscyB0byB0aGUgbGVuZ3RoIG9mIHdyaXR0ZW4K
PiA+ID4gPiBzdHJpbmcsIHRoZW4gdGhlIHR3byBtZGV2IGRldmljZXMgaW4gc291cmNlIGFuZCB0
YXJnZXQgc2lkZSBhcmUgY29tcGF0aWJsZS4KPiA+ID4gPiBlLmcuCj4gPiA+ID4gKGEpIGNvbXBh
dGliaWxpdHkgY2FzZQo+ID4gPiA+ICIjIGVjaG8gMDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVf
NCA+Cj4gPiA+ID4gL3N5cy9idXMvcGNpL2RldmljZXMvMDAwMFw6MDBcOjAyLjAvODgyY2M0ZGEt
ZGVkZS0xMWU3LTkxODAtMDc4YTYyMDYzYWIxL21kZXZfdHlwZS92ZXJzaW9uIgo+ID4gPiA+IAo+
ID4gPiA+IChiKSBpbmNvbXBhdGliaWxpdHkgY2FzZQo+ID4gPiA+ICIjZWNobyAwMDAyODA4Ni0x
OTNiLWk5MTUtR1ZUZ19WNV8xID4KPiA+ID4gPiAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDow
MFw6MDIuMC84ODJjYzRkYS1kZWRlLTExZTctOTE4MC0wNzhhNjIwNjNhYjEvbWRldl90eXBlL3Zl
cnNpb24iCj4gPiA+ID4gLWJhc2g6IGVjaG86IHdyaXRlIGVycm9yOiBJbnZhbGlkIGFyZ3VtZW50
Cj4gPiA+ID4gCj4gPiA+ID4gMy4gaWYgdHdvIG1kZXYgZGV2aWNlcyBhcmUgY29tcGF0aWJsZSwg
dXNlciBzcGFjZSBzb2Z0d2FyZSBjYW4gc3RhcnQKPiA+ID4gPiBsaXZlIG1pZ3JhdGlvbiwgYW5k
IHZpY2UgdmVyc2EuCj4gPiA+ID4gCj4gPiA+ID4gTm90ZTogaWYgYSBtZGV2IGRldmljZSBkb2Vz
IG5vdCBzdXBwb3J0IGxpdmUgbWlncmF0aW9uLCBpdCBlaXRoZXIgZG9lcwo+ID4gPiA+IG5vdCBw
cm92aWRlIGEgdmVyc2lvbiBhdHRyaWJ1dGUsIG9yIGFsd2F5cyByZXR1cm5zIGVycm5vIHdoZW4g
aXRzIHZlcnNpb24KPiA+ID4gPiBhdHRyaWJ1dGUgaXMgcmVhZC93cml0dGVuLiAgCj4gPiA+IAo+
ID4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFuZXIgdG8gZG8gdGhlIGZvcm1lciwgbm90IHN1
cHBseSB0aGUKPiA+ID4gYXR0cmlidXRlLiAgVGhpcyBzZWVtcyB0byBkbyB0aGUgbGF0dGVyIGlu
IHRoZSBzYW1wbGUgZHJpdmVycy4gIFRoYW5rcywgIAo+ID4gT2suIHlvdSBhcmUgcmlnaHQhCj4g
PiB3aGF0IGFib3V0IGp1c3Qga2VlcCBvbmUgc2FtcGxlIGRyaXZlciB0byBzaG93IGhvdyB0byBk
byB0aGUgbGF0dGVyLAo+ID4gYW5kIGxldCB0aGUgb3RoZXJzIGRvIHRoZSBmb3JtZXI/Cj4gCj4g
SSdkIHJhdGhlciB0aGF0IGlmIGEgdmVuZG9yIGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgZmVhdHVy
ZXMgcmVxdWlyaW5nCj4gdGhlIHZlcnNpb24gYXR0cmlidXRlIHRoYXQgdGhleSBkb24ndCBpbXBs
ZW1lbnQgaXQuICBJdCdzIGNvbmZ1c2luZyB0bwo+IGRldmVsb3BlcnMgbG9va2luZyBhdCB0aGUg
c2FtcGxlIGRyaXZlciBmb3IgZ3VpZGFuY2UgaWYgd2UgaGF2ZQo+IGRpZmZlcmVudCBpbXBsZW1l
bnRhdGlvbnMuICBPZiBjb3Vyc2UgaWYgeW91J2QgbGlrZSB0byBhZGQgbWlncmF0aW9uCj4gc3Vw
cG9ydCB0byBvbmUgb2YgdGhlIHNhbXBsZSBkcml2ZXJzLCB0aGF0J2QgYmUgdmVyeSB3ZWxjb21l
LiAgVGhhbmtzLAo+CkdvdCBpdDopCgpUaGFua3MhCllhbgoKPiAKPiA+ID4gPiBDYzogQWxleCBX
aWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogRXJpayBT
a3VsdGV0eSA8ZXNrdWx0ZXRAcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogIkRyLiBEYXZpZCBBbGFu
IEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPgo+ID4gPiA+IENjOiBDb3JuZWxpYSBIdWNr
IDxjb2h1Y2tAcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogIlRpYW4sIEtldmluIiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+Cj4gPiA+ID4gQ2M6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVs
LmNvbT4KPiA+ID4gPiBDYzogIldhbmcsIFpoaSBBIiA8emhpLmEud2FuZ0BpbnRlbC5jb20+Cj4g
PiA+ID4gQ2M6IE5lbyBKaWEgPGNqaWFAbnZpZGlhLmNvbT4KPiA+ID4gPiBDYzogS2lydGkgV2Fu
a2hlZGUgPGt3YW5raGVkZUBudmlkaWEuY29tPgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAg
RG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmljZS50eHQgfCAzNiArKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gPiA+ICBzYW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyAgICAgICAg
ICAgICB8IDE3ICsrKysrKysrKysrKwo+ID4gPiA+ICBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LmMg
ICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKwo+ID4gPiA+ICBzYW1wbGVzL3ZmaW8tbWRl
di9tdHR5LmMgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKwo+ID4gPiA+ICA0IGZpbGVz
IGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmljZS50eHQgYi9Eb2N1bWVudGF0aW9uL3Zm
aW8tbWVkaWF0ZWQtZGV2aWNlLnR4dAo+ID4gPiA+IGluZGV4IGMzZjY5YmNhZjk2ZS4uYmMyODQ3
MWMwNjY3IDEwMDY0NAo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdmZpby1tZWRpYXRlZC1k
ZXZpY2UudHh0Cj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi92ZmlvLW1lZGlhdGVkLWRldmlj
ZS50eHQKPiA+ID4gPiBAQCAtMjAyLDYgKzIwMiw3IEBAIERpcmVjdG9yaWVzIGFuZCBmaWxlcyB1
bmRlciB0aGUgc3lzZnMgZm9yIEVhY2ggUGh5c2ljYWwgRGV2aWNlCj4gPiA+ID4gICAgfCAgICAg
fCAgIHwtLS0gYXZhaWxhYmxlX2luc3RhbmNlcwo+ID4gPiA+ICAgIHwgICAgIHwgICB8LS0tIGRl
dmljZV9hcGkKPiA+ID4gPiAgICB8ICAgICB8ICAgfC0tLSBkZXNjcmlwdGlvbgo+ID4gPiA+ICsg
IHwgICAgIHwgICB8LS0tIHZlcnNpb24KPiA+ID4gPiAgICB8ICAgICB8ICAgfC0tLSBbZGV2aWNl
c10KPiA+ID4gPiAgICB8ICAgICB8LS0tIFs8dHlwZS1pZD5dCj4gPiA+ID4gICAgfCAgICAgfCAg
IHwtLS0gY3JlYXRlCj4gPiA+ID4gQEAgLTIwOSw2ICsyMTAsNyBAQCBEaXJlY3RvcmllcyBhbmQg
ZmlsZXMgdW5kZXIgdGhlIHN5c2ZzIGZvciBFYWNoIFBoeXNpY2FsIERldmljZQo+ID4gPiA+ICAg
IHwgICAgIHwgICB8LS0tIGF2YWlsYWJsZV9pbnN0YW5jZXMKPiA+ID4gPiAgICB8ICAgICB8ICAg
fC0tLSBkZXZpY2VfYXBpCj4gPiA+ID4gICAgfCAgICAgfCAgIHwtLS0gZGVzY3JpcHRpb24KPiA+
ID4gPiArICB8ICAgICB8ICAgfC0tLSB2ZXJzaW9uCj4gPiA+ID4gICAgfCAgICAgfCAgIHwtLS0g
W2RldmljZXNdCj4gPiA+ID4gICAgfCAgICAgfC0tLSBbPHR5cGUtaWQ+XQo+ID4gPiA+ICAgIHwg
ICAgICAgICAgfC0tLSBjcmVhdGUKPiA+ID4gPiBAQCAtMjE2LDYgKzIxOCw3IEBAIERpcmVjdG9y
aWVzIGFuZCBmaWxlcyB1bmRlciB0aGUgc3lzZnMgZm9yIEVhY2ggUGh5c2ljYWwgRGV2aWNlCj4g
PiA+ID4gICAgfCAgICAgICAgICB8LS0tIGF2YWlsYWJsZV9pbnN0YW5jZXMKPiA+ID4gPiAgICB8
ICAgICAgICAgIHwtLS0gZGV2aWNlX2FwaQo+ID4gPiA+ICAgIHwgICAgICAgICAgfC0tLSBkZXNj
cmlwdGlvbgo+ID4gPiA+ICsgIHwgICAgICAgICAgfC0tLSB2ZXJzaW9uCj4gPiA+ID4gICAgfCAg
ICAgICAgICB8LS0tIFtkZXZpY2VzXQo+ID4gPiA+ICAKPiA+ID4gPiAgKiBbbWRldl9zdXBwb3J0
ZWRfdHlwZXNdCj4gPiA+ID4gQEAgLTIyNSw2ICsyMjgsOCBAQCBEaXJlY3RvcmllcyBhbmQgZmls
ZXMgdW5kZXIgdGhlIHN5c2ZzIGZvciBFYWNoIFBoeXNpY2FsIERldmljZQo+ID4gPiA+ICAgIFs8
dHlwZS1pZD5dLCBkZXZpY2VfYXBpLCBhbmQgYXZhaWxhYmxlX2luc3RhbmNlcyBhcmUgbWFuZGF0
b3J5IGF0dHJpYnV0ZXMKPiA+ID4gPiAgICB0aGF0IHNob3VsZCBiZSBwcm92aWRlZCBieSB2ZW5k
b3IgZHJpdmVyLgo+ID4gPiA+ICAKPiA+ID4gPiArICB2ZXJzaW9uIGlzIGEgbWFuZGF0b3J5IGF0
dHJpYnV0ZSBpZiBhIG1kZXYgZGV2aWNlIHN1cHBvcnRzIGxpdmUgbWlncmF0aW9uLgo+ID4gPiA+
ICsKPiA+ID4gPiAgKiBbPHR5cGUtaWQ+XQo+ID4gPiA+ICAKPiA+ID4gPiAgICBUaGUgWzx0eXBl
LWlkPl0gbmFtZSBpcyBjcmVhdGVkIGJ5IGFkZGluZyB0aGUgZGV2aWNlIGRyaXZlciBzdHJpbmcg
YXMgYSBwcmVmaXgKPiA+ID4gPiBAQCAtMjQ2LDYgKzI1MSwzNSBAQCBEaXJlY3RvcmllcyBhbmQg
ZmlsZXMgdW5kZXIgdGhlIHN5c2ZzIGZvciBFYWNoIFBoeXNpY2FsIERldmljZQo+ID4gPiA+ICAg
IFRoaXMgYXR0cmlidXRlIHNob3VsZCBzaG93IHRoZSBudW1iZXIgb2YgZGV2aWNlcyBvZiB0eXBl
IDx0eXBlLWlkPiB0aGF0IGNhbiBiZQo+ID4gPiA+ICAgIGNyZWF0ZWQuCj4gPiA+ID4gIAo+ID4g
PiA+ICsqIHZlcnNpb24KPiA+ID4gPiArCj4gPiA+ID4gKyAgVGhpcyBhdHRyaWJ1dGUgaXMgcncu
IEl0IGlzIHVzZWQgdG8gY2hlY2sgd2hldGhlciB0d28gZGV2aWNlcyBhcmUgY29tcGF0aWJsZQo+
ID4gPiA+ICsgIGZvciBsaXZlIG1pZ3JhdGlvbi4gSWYgdGhpcyBhdHRyaWJ1dGUgaXMgbWlzc2lu
ZywgdGhlbiB0aGUgY29ycmVzcG9uZGluZyBtZGV2Cj4gPiA+ID4gKyAgZGV2aWNlIGlzIHJlZ2Fy
ZGVkIGFzIG5vdCBzdXBwb3J0aW5nIGxpdmUgbWlncmF0aW9uLgo+ID4gPiA+ICsKPiA+ID4gPiAr
ICBJdCBjb25zaXN0cyBvZiB0d28gcGFydHM6IGNvbW1vbiBwYXJ0IGFuZCB2ZW5kb3IgcHJvcHJp
ZXRhcnkgcGFydC4KPiA+ID4gPiArICBjb21tb24gcGFydDogMzIgYml0LiBsb3dlciAxNiBiaXRz
IGlzIHZlbmRvciBpZCBhbmQgaGlnaGVyIDE2IGJpdHMgaWRlbnRpZmllcwo+ID4gPiA+ICsgICAg
ICAgICAgICAgICBkZXZpY2UgdHlwZS4gZS5nLiwgZm9yIHBjaSBkZXZpY2UsIGl0IGlzCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICJwY2kgdmVuZG9yIGlkIiB8IChWRklPX0RFVklDRV9GTEFHU19Q
Q0kgPDwgMTYpLgo+ID4gPiA+ICsgIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0OiB0aGlzIHBhcnQg
aXMgdmFyaWVkIGluIGxlbmd0aC4gdmVuZG9yIGRyaXZlciBjYW4KPiA+ID4gPiArICAgICAgICAg
ICAgICAgc3BlY2lmeSBhbnkgc3RyaW5nIHRvIGlkZW50aWZ5IGEgZGV2aWNlLgo+ID4gPiA+ICsK
PiA+ID4gPiArICBXaGVuIHJlYWRpbmcgdGhpcyBhdHRyaWJ1dGUsIGl0IHNob3VsZCBzaG93IGRl
dmljZSB2ZXJzaW9uIHN0cmluZyBvZiB0aGUgZGV2aWNlCj4gPiA+ID4gKyAgb2YgdHlwZSA8dHlw
ZS1pZD4uIElmIGEgZGV2aWNlIGRvZXMgbm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24sIGl0IHNo
b3VsZAo+ID4gPiA+ICsgIHJldHVybiBlcnJuby4KPiA+ID4gPiArICBXaGVuIHdyaXRpbmcgYSBz
dHJpbmcgdG8gdGhpcyBhdHRyaWJ1dGUsIGl0IHJldHVybnMgZXJybm8gZm9yIGluY29tcGF0aWJp
bGl0eQo+ID4gPiA+ICsgIG9yIHJldHVybnMgd3JpdHRlbiBzdHJpbmcgbGVuZ3RoIGluIGNvbXBh
dGliaWxpdHkgY2FzZS4gSWYgYSBkZXZpY2UgZG9lcyBub3QKPiA+ID4gPiArICBzdXBwb3J0IGxp
dmUgbWlncmF0aW9uLCBpdCBhbHdheXMgcmV0dXJucyBlcnJuby4KPiA+ID4gPiArCj4gPiA+ID4g
KyAgZm9yIGV4YW1wbGUuCj4gPiA+ID4gKyAgIyBjYXQgXAo+ID4gPiA+ICsgL3N5cy9idXMvcGNp
L2RldmljZXMvMDAwMFw6MDBcOjAyLjAvbWRldl9zdXBwb3J0ZWRfdHlwZXMvaTkxNS1HVlRnX1Y1
XzIvdmVyc2lvbgo+ID4gPiA+ICsgIDAwMDI4MDg2LTE5M2ItaTkxNS1HVlRnX1Y1XzIKPiA+ID4g
PiArCj4gPiA+ID4gKyAgI2VjaG8gMDAwMjgwODYtMTkzYi1pOTE1LUdWVGdfVjVfMiA+IFwKPiA+
ID4gPiArIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzAwMDBcOjAwXDowMi4wL21kZXZfc3VwcG9ydGVk
X3R5cGVzL2k5MTUtR1ZUZ19WNV80L3ZlcnNpb24KPiA+ID4gPiArIC1iYXNoOiBlY2hvOiB3cml0
ZSBlcnJvcjogSW52YWxpZCBhcmd1bWVudAo+ID4gPiA+ICsKPiA+ID4gPiAgKiBbZGV2aWNlXQo+
ID4gPiA+ICAKPiA+ID4gPiAgICBUaGlzIGRpcmVjdG9yeSBjb250YWlucyBsaW5rcyB0byB0aGUg
ZGV2aWNlcyBvZiB0eXBlIDx0eXBlLWlkPiB0aGF0IGhhdmUgYmVlbgo+ID4gPiA+IEBAIC0zMjcs
MTIgKzM2MSwxNCBAQCBjYXJkLgo+ID4gPiA+ICAgICAgICAgIHwgICB8ICAgfC0tIGF2YWlsYWJs
ZV9pbnN0YW5jZXMKPiA+ID4gPiAgICAgICAgICB8ICAgfCAgIHwtLSBjcmVhdGUKPiA+ID4gPiAg
ICAgICAgICB8ICAgfCAgIHwtLSBkZXZpY2VfYXBpCj4gPiA+ID4gKyAgICAgICAgfCAgIHwgICB8
LS0gdmVyc2lvbgo+ID4gPiA+ICAgICAgICAgIHwgICB8ICAgfC0tIGRldmljZXMKPiA+ID4gPiAg
ICAgICAgICB8ICAgfCAgIGAtLSBuYW1lCj4gPiA+ID4gICAgICAgICAgfCAgIGAtLSBtdHR5LTIK
PiA+ID4gPiAgICAgICAgICB8ICAgICAgIHwtLSBhdmFpbGFibGVfaW5zdGFuY2VzCj4gPiA+ID4g
ICAgICAgICAgfCAgICAgICB8LS0gY3JlYXRlCj4gPiA+ID4gICAgICAgICAgfCAgICAgICB8LS0g
ZGV2aWNlX2FwaQo+ID4gPiA+ICsgICAgICAgIHwgICAgICAgfC0tIHZlcnNpb24KPiA+ID4gPiAg
ICAgICAgICB8ICAgICAgIHwtLSBkZXZpY2VzCj4gPiA+ID4gICAgICAgICAgfCAgICAgICBgLS0g
bmFtZQo+ID4gPiA+ICAgICAgICAgIHwtLSBtdHR5X2Rldgo+ID4gPiA+IGRpZmYgLS1naXQgYS9z
YW1wbGVzL3ZmaW8tbWRldi9tYm9jaHMuYyBiL3NhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jCj4g
PiA+ID4gaW5kZXggYjAzOGFhOWY1YTcwLi4yZjViYTk2YjkxYTIgMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvc2FtcGxlcy92ZmlvLW1kZXYvbWJvY2hzLmMKPiA+ID4gPiArKysgYi9zYW1wbGVzL3ZmaW8t
bWRldi9tYm9jaHMuYwo+ID4gPiA+IEBAIC0xMzkxLDExICsxMzkxLDI4IEBAIHN0YXRpYyBzc2l6
ZV90IGRldmljZV9hcGlfc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGRldmljZSAq
ZGV2LAo+ID4gPiA+ICB9Cj4gPiA+ID4gIE1ERVZfVFlQRV9BVFRSX1JPKGRldmljZV9hcGkpOwo+
ID4gPiA+ICAKPiA+ID4gPiArc3RhdGljIHNzaXplX3QgdmVyc2lvbl9zaG93KHN0cnVjdCBrb2Jq
ZWN0ICprb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ID4gKwkJY2hhciAqYnVmKQo+ID4g
PiA+ICt7Cj4gPiA+ID4gKwkvKiBkbyBub3Qgc3VwcG9ydCBsaXZlIG1pZ3JhdGlvbiAqLwo+ID4g
PiA+ICsJcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gK30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRp
YyBzc2l6ZV90IHZlcnNpb25fc3RvcmUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiA+ID4gPiArCQljb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkKPiA+ID4g
PiArewo+ID4gPiA+ICsJLyogZG8gbm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24gKi8KPiA+ID4g
PiArCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMg
TURFVl9UWVBFX0FUVFJfUlcodmVyc2lvbik7Cj4gPiA+ID4gKwo+ID4gPiA+ICBzdGF0aWMgc3Ry
dWN0IGF0dHJpYnV0ZSAqbWRldl90eXBlc19hdHRyc1tdID0gewo+ID4gPiA+ICAJJm1kZXZfdHlw
ZV9hdHRyX25hbWUuYXR0ciwKPiA+ID4gPiAgCSZtZGV2X3R5cGVfYXR0cl9kZXNjcmlwdGlvbi5h
dHRyLAo+ID4gPiA+ICAJJm1kZXZfdHlwZV9hdHRyX2RldmljZV9hcGkuYXR0ciwKPiA+ID4gPiAg
CSZtZGV2X3R5cGVfYXR0cl9hdmFpbGFibGVfaW5zdGFuY2VzLmF0dHIsCj4gPiA+ID4gKwkmbWRl
dl90eXBlX2F0dHJfdmVyc2lvbi5hdHRyLAo+ID4gPiA+ICAJTlVMTCwKPiA+ID4gPiAgfTsKPiA+
ID4gPiAgCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYyBiL3Nh
bXBsZXMvdmZpby1tZGV2L21kcHkuYwo+ID4gPiA+IGluZGV4IGNjODZiZjY1NjZlNC4uZmYxNWZk
ZmM3ZDQ2IDEwMDY0NAo+ID4gPiA+IC0tLSBhL3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYwo+ID4g
PiA+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHkuYwo+ID4gPiA+IEBAIC02OTUsMTEgKzY5
NSwyNyBAQCBzdGF0aWMgc3NpemVfdCBkZXZpY2VfYXBpX3Nob3coc3RydWN0IGtvYmplY3QgKmtv
YmosIHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ID4gPiAgfQo+ID4gPiA+ICBNREVWX1RZUEVfQVRU
Ul9STyhkZXZpY2VfYXBpKTsKPiA+ID4gPiAgCj4gPiA+ID4gK3N0YXRpYyBzc2l6ZV90IHZlcnNp
b25fc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGRldmljZSAqZGV2LAo+ID4gPiA+
ICsJCWNoYXIgKmJ1ZikKPiA+ID4gPiArewo+ID4gPiA+ICsJLyogZG8gbm90IHN1cHBvcnQgbGl2
ZSBtaWdyYXRpb24gKi8KPiA+ID4gPiArCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICt9Cj4gPiA+
ID4gKwo+ID4gPiA+ICtzdGF0aWMgc3NpemVfdCB2ZXJzaW9uX3N0b3JlKHN0cnVjdCBrb2JqZWN0
ICprb2JqLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ID4gKwkJY29uc3QgY2hhciAqYnVmLCBz
aXplX3QgY291bnQpCj4gPiA+ID4gK3sKPiA+ID4gPiArCS8qIGRvIG5vdCBzdXBwb3J0IGxpdmUg
bWlncmF0aW9uICovCj4gPiA+ID4gKwlyZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArfQo+ID4gPiA+
ICtzdGF0aWMgTURFVl9UWVBFX0FUVFJfUlcodmVyc2lvbik7Cj4gPiA+ID4gKwo+ID4gPiA+ICBz
dGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqbWRldl90eXBlc19hdHRyc1tdID0gewo+ID4gPiA+ICAJ
Jm1kZXZfdHlwZV9hdHRyX25hbWUuYXR0ciwKPiA+ID4gPiAgCSZtZGV2X3R5cGVfYXR0cl9kZXNj
cmlwdGlvbi5hdHRyLAo+ID4gPiA+ICAJJm1kZXZfdHlwZV9hdHRyX2RldmljZV9hcGkuYXR0ciwK
PiA+ID4gPiAgCSZtZGV2X3R5cGVfYXR0cl9hdmFpbGFibGVfaW5zdGFuY2VzLmF0dHIsCj4gPiA+
ID4gKwkmbWRldl90eXBlX2F0dHJfdmVyc2lvbi5hdHRyLAo+ID4gPiA+ICAJTlVMTCwKPiA+ID4g
PiAgfTsKPiA+ID4gPiAgCj4gPiA+ID4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZpby1tZGV2L210
dHkuYyBiL3NhbXBsZXMvdmZpby1tZGV2L210dHkuYwo+ID4gPiA+IGluZGV4IDFjNzdjMzcwYzky
Zi4uNGFlM2FhZDM0NzRkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL3NhbXBsZXMvdmZpby1tZGV2L210
dHkuYwo+ID4gPiA+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L210dHkuYwo+ID4gPiA+IEBAIC0x
MzkwLDEwICsxMzkwLDI2IEBAIHN0YXRpYyBzc2l6ZV90IGRldmljZV9hcGlfc2hvdyhzdHJ1Y3Qg
a29iamVjdCAqa29iaiwgc3RydWN0IGRldmljZSAqZGV2LAo+ID4gPiA+ICAKPiA+ID4gPiAgTURF
Vl9UWVBFX0FUVFJfUk8oZGV2aWNlX2FwaSk7Cj4gPiA+ID4gIAo+ID4gPiA+ICtzdGF0aWMgc3Np
emVfdCB2ZXJzaW9uX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBkZXZpY2UgKmRl
diwKPiA+ID4gPiArCQljaGFyICpidWYpCj4gPiA+ID4gK3sKPiA+ID4gPiArCS8qIGRvIG5vdCBz
dXBwb3J0IGxpdmUgbWlncmF0aW9uICovCj4gPiA+ID4gKwlyZXR1cm4gLUVJTlZBTDsKPiA+ID4g
PiArfQo+ID4gPiA+ICsKPiA+ID4gPiArc3RhdGljIHNzaXplX3QgdmVyc2lvbl9zdG9yZShzdHJ1
Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGRldmljZSAqZGV2LAo+ID4gPiA+ICsJCWNvbnN0IGNo
YXIgKmJ1Ziwgc2l6ZV90IGNvdW50KQo+ID4gPiA+ICt7Cj4gPiA+ID4gKwkvKiBkbyBub3Qgc3Vw
cG9ydCBsaXZlIG1pZ3JhdGlvbiAqLwo+ID4gPiA+ICsJcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4g
K30KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBNREVWX1RZUEVfQVRUUl9SVyh2ZXJzaW9uKTsK
PiA+ID4gPiAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKm1kZXZfdHlwZXNfYXR0cnNbXSA9IHsK
PiA+ID4gPiAgCSZtZGV2X3R5cGVfYXR0cl9uYW1lLmF0dHIsCj4gPiA+ID4gIAkmbWRldl90eXBl
X2F0dHJfZGV2aWNlX2FwaS5hdHRyLAo+ID4gPiA+ICAJJm1kZXZfdHlwZV9hdHRyX2F2YWlsYWJs
ZV9pbnN0YW5jZXMuYXR0ciwKPiA+ID4gPiArCSZtZGV2X3R5cGVfYXR0cl92ZXJzaW9uLmF0dHIs
Cj4gPiA+ID4gIAlOVUxMLAo+ID4gPiA+ICB9Owo+ID4gPiA+ICAgIAo+ID4gPiAKPiA+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKPiA+ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1ndnQtZGV2ICAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0Cj4gaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
