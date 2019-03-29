// Initial wiring: [14, 18, 6, 0, 7, 16, 15, 13, 11, 19, 2, 4, 3, 5, 9, 17, 1, 12, 10, 8]
// Resulting wiring: [14, 18, 6, 0, 7, 16, 15, 13, 11, 19, 2, 4, 3, 5, 9, 17, 1, 12, 10, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[9];
cx q[16], q[17];
cx q[14], q[15];
cx q[6], q[7];
