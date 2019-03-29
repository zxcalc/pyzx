// Initial wiring: [12, 10, 14, 15, 16, 3, 1, 5, 9, 19, 17, 4, 6, 0, 13, 11, 7, 18, 2, 8]
// Resulting wiring: [12, 10, 14, 15, 16, 3, 1, 5, 9, 19, 17, 4, 6, 0, 13, 11, 7, 18, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[13];
cx q[18], q[17];
cx q[18], q[12];
cx q[11], q[17];
cx q[8], q[9];
cx q[4], q[5];
cx q[5], q[14];
cx q[3], q[5];
