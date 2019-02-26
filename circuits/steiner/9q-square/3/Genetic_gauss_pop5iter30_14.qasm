// Initial wiring: [0 1 2 3 6 7 4 5 8]
// Resulting wiring: [0 1 2 3 6 7 4 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[4];
cx q[5], q[6];
