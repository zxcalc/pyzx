// Initial wiring: [1 0 2 8 4 5 7 3 6]
// Resulting wiring: [2 0 1 8 4 5 7 3 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[2], q[1];
cx q[2], q[1];
cx q[0], q[1];
cx q[6], q[5];
cx q[4], q[7];
