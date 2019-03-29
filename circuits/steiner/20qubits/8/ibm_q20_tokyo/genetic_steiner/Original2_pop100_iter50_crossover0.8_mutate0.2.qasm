// Initial wiring: [17, 11, 1, 10, 15, 3, 5, 19, 7, 16, 0, 8, 9, 14, 13, 12, 18, 2, 4, 6]
// Resulting wiring: [17, 11, 1, 10, 15, 3, 5, 19, 7, 16, 0, 8, 9, 14, 13, 12, 18, 2, 4, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[6], q[5];
cx q[14], q[5];
cx q[16], q[14];
cx q[18], q[17];
cx q[18], q[12];
cx q[8], q[11];
cx q[2], q[3];
