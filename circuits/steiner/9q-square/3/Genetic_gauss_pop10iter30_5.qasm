// Initial wiring: [0 1 2 8 3 4 7 6 5]
// Resulting wiring: [0 1 2 8 3 4 7 6 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[5], q[6];
cx q[3], q[2];
