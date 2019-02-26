// Initial wiring: [0 7 2 3 1 5 6 4 8]
// Resulting wiring: [0 7 2 3 1 6 5 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[0], q[5];
cx q[7], q[8];
