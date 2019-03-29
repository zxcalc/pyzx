// Initial wiring: [1, 16, 0, 12, 8, 11, 19, 9, 13, 4, 6, 10, 7, 15, 18, 2, 3, 17, 14, 5]
// Resulting wiring: [1, 16, 0, 12, 8, 11, 19, 9, 13, 4, 6, 10, 7, 15, 18, 2, 3, 17, 14, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[13], q[12];
cx q[14], q[13];
cx q[14], q[5];
cx q[18], q[17];
cx q[3], q[6];
cx q[6], q[12];
