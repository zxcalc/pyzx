// Initial wiring: [1 0 2 3 4 5 7 6 8]
// Resulting wiring: [2 0 1 3 4 5 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[2], q[1];
cx q[0], q[1];
cx q[5], q[6];
cx q[3], q[2];
cx q[7], q[8];
